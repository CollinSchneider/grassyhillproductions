class User < ActiveRecord::Base
  validates :email, uniqueness: true
  validates :password, confirmation: true

  has_one :retailer
  has_one :admin

end
