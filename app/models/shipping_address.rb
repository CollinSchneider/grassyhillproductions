class ShippingAddress < ActiveRecord::Base

  belongs_to :retailer
  has_many :orders

end
