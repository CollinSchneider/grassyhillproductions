class AddTitleToLedPictures < ActiveRecord::Migration
  def change
    add_column :led_picture, :title, :string
  end
end
