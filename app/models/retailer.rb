class Retailer < ActiveRecord::Base

  has_many :shipping_addresses
  has_many :cart_items
  has_many :orders

  belongs_to :user

  before_validation(on: :create) do
    self.stripe_id = make_stripe_id
  end

  def make_stripe_id
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']
    customer = Stripe::Customer.create({
        :description => "Customer for #{self.user.email}"
    })
    return customer.id
  end

  def needs_credit_card?
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']
    customer = Stripe::Customer.retrieve(self.stripe_id)
    return customer.default_source.nil?
  end

  def credit_cards
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']
    customer = Stripe::Customer.retrieve(self.stripe_id)
    return customer.sources
  end

  def primary_card
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']
    customer = Stripe::Customer.retrieve(self.stripe_id)
    return customer.sources.retrieve(customer.default_source)
  end

end
