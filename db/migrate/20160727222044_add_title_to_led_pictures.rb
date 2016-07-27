class AddTitleToLedPictures < ActiveRecord::Migration
  def change
    add_column :led_pictures, :title, :string
  end
end
