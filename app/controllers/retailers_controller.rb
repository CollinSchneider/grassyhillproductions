class RetailersController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def add_credit_card
    token = params[:stripeToken]
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']
    customer = Stripe::Customer.retrieve(current_user.retailer.stripe_id)
    customer.sources.create({:source => token})
    redirect_to request.referrer
  end

  def checkout

    if request.post?
      stripe_card_id = params[:stripe_card_id]
      shipping_id = params[:shipping_id]
      if stripe_card_id.nil? || shipping_id.nil?
        flash[:error] = "Please select shipping address and credit card."
        return redirect_to request.referrer
      end

      order = Order.new
      order.stripe_card_id = stripe_card_id
      order.shipping_id = shipping_id
      order.retailer_id = current_user.retailer.id

      charge_amount = 0
      current_user.retailer.cart_items.each do |cart|
        charge_amount += cart.price.to_f
        order_item = OrderItem.new
        order_item.quantity = cart.quantity
        order_item.order = order
        order_item.product_id = cart.product.id
        order_item.save!
        cart.delete
      end
      order.sale_amount = charge_amount.to_f

      Stripe.api_key = ENV['STRIPE_SECRET_KEY']
      begin
        binding.pry
        charge = Stripe::Charge.create(
          :amount => (charge_amount*100).to_i,
          :currency => 'usd',
          :card => stripe_card_id,
          :customer => current_user.retailer.stripe_id,
          :description => "#{current_user.email} charge"
        )
        if !charge.nil?
          order.stripe_charge_id = charge.id
          order.save!
          return redirect_to "/thank_you?id=#{order.id}"
        end
      rescue Stripe::CardError => e
        order.card_failed = true
        order.card_failed_date = DateTime.now
        order.save!
        return redirect_to '/fix_card'
      end
    end
  end

end
