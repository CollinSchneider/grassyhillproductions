class Change < ActiveRecord::Migration
  def change
    add_column :retailers, :stripe_id, :string
    remove_column :users, :stripe_id
  end
end
