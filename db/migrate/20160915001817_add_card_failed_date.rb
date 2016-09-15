class AddCardFailedDate < ActiveRecord::Migration
  def change
    add_column :orders, :card_failed_date, :timestamp
  end
end
