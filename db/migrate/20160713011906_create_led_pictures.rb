class CreateLedPictures < ActiveRecord::Migration
  def change
    create_table :led_picture do |t|
      t.string :code

      t.timestamps null: false
    end
  end
end
