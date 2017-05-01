class AddImages < ActiveRecord::Migration
  def change
    add_attachment :greeting_cards, :front_image
    add_attachment :greeting_cards, :inside_image
    add_attachment :led_picture, :image
    add_attachment :led_picture, :gif
    add_attachment :guitar_string_bracelets, :image
  end
end
