class CreateGreetingCards < ActiveRecord::Migration
  def change
    create_table :greeting_cards do |t|
      t.string :code
      t.string :category

      t.timestamps null: false
    end
  end
end
