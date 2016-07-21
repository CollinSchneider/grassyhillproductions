class CreateGuitarStringBracelets < ActiveRecord::Migration
  def change
    create_table :guitar_string_bracelets do |t|
      t.string :code
      t.string :description

      t.timestamps null: false
    end
  end
end
