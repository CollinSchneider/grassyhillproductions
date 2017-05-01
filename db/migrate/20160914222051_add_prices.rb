class AddPrices < ActiveRecord::Migration
  def change
    add_column :greeting_cards, :wholesale_price, :decimal
    add_column :led_picture, :wholesale_price, :decimal
    add_column :guitar_string_bracelets, :wholesale_price, :decimal
  end
end
