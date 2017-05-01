class AddDiscontinuedToProducts < ActiveRecord::Migration
  def change
    add_column :greeting_cards, :discontinued, :boolean, default: false
    add_column :guitar_string_bracelets, :discontinued, :boolean, default: false
    add_column :led_picture, :discontinued, :boolean, default: false
  end
end
