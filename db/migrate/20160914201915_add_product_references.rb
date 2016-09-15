class AddProductReferences < ActiveRecord::Migration
  def change
    add_reference :greeting_cards, :product
    add_reference :led_pictures, :product
    add_reference :guitar_string_bracelets, :product
  end
end
