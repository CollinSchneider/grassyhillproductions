class User < ActiveRecord::Base
  has_secure_password

  after_create :downcase

  def downcase
    update_column(:username, username.downcase)
  end

end
