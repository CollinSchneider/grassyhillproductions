class CreateShippingAddresses < ActiveRecord::Migration
  def change
    create_table :shipping_addresses do |t|
      t.references :retailer, index: true, foreign_key: true
      t.string :street_one
      t.string :street_two
      t.string :city
      t.string :zip
      t.string :state

      t.timestamps null: false
    end
  end
end
