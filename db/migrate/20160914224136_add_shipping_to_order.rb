class AddShippingToOrder < ActiveRecord::Migration
  def change
    add_reference :orders, :shipping, index: true
  end
end
