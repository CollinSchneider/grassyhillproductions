class Product < ActiveRecord::Base

  has_one :greeting_card
  has_one :led_picture
  has_one :guitar_string_bracelet
  has_many :order_items
  has_many :cart_items

  def code
    self.greeting_card.code || self.led_picture.code || self.guitar_string_bracelet.code
  end

  def price
    self.greeting_card.wholesale_price || self.led_picture.wholesale_price || self.guitar_string_bracelet.wholesale_price
  end

  def image
    self.greeting_card.front_image || self.led_picture.image || self.guitar_string_bracelet.image
  end

end
