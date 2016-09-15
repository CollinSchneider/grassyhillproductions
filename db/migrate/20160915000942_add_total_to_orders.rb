class AddTotalToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :sale_amount, :decimal
  end
end
