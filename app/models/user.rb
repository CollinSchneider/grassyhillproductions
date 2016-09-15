class User < ActiveRecord::Base
  has_secure_password

  validates :email, uniqueness: true
  validates :password, confirmation: true

  has_one :retailer
  has_one :admin

end
