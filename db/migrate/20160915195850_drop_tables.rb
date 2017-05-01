class DropTables < ActiveRecord::Migration
  def change
    remove_column :greeting_cards, :product_id
    remove_column :led_picture, :product_id
    remove_column :guitar_string_bracelets, :product_id
    drop_table :order_items
    drop_table :orders
    drop_table :cart_items
    drop_table :shipping_addresses
    drop_table :retailers
    drop_table :admins
    drop_table :users
    drop_table :products
  end
end
