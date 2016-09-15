class Order < ActiveRecord::Base

  has_many :order_items
  belongs_to :shipping_address
  belongs_to :retailer

end
