class CartItemsController < ApplicationController

  def create
    cart_item = CartItem.create(cart_items_params)
    if cart_item.save
      flash[:success] = "#{cart_item.quantity} added to cart"
    else
      flash[:error] = cart_item.errors.full_messages
    end
    return redirect_to request.referrer
  end

  private
  def cart_items_params
    params.require(:cart_item).permit(:quantity, :product_id, :retailer_id)
  end

end
