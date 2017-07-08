class PolymorphicLedPicture < ActiveRecord::Migration
  def change
    add_column :led_pictures, :type, :string, default: 'Vertical'
  end
end
