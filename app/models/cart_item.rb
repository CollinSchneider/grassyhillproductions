class CartItem < ActiveRecord::Base

  belongs_to :retailer
  belongs_to :product

  def price
    price = self.product.greeting_card.wholesale_price || self.product.led_picture.wholesale_price || self.product.guitar_string_bracelet.wholesale_price
    return price*self.quantity
  end

end
