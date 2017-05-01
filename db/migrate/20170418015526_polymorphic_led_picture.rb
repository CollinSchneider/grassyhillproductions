class PolymorphicLedPicture < ActiveRecord::Migration
  def change
    add_column :led_pictures, :type, :string
    ActiveRecord::Base.connection.execute("update led_pictures set type = 'Vertical' where type IS NULL")
  end
end
