class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :retailer, index: true, foreign_key: true
      t.string :stripe_card_id
      t.string :stripe_charge_id
      t.boolean :card_failed
      t.timestamps :card_failed_date

      t.timestamps null: false
    end
  end
end
