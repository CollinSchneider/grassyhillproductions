# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170418015526) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "greeting_cards", force: :cascade do |t|
    t.string   "code"
    t.string   "category"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "front_image_file_name"
    t.string   "front_image_content_type"
    t.integer  "front_image_file_size"
    t.datetime "front_image_updated_at"
    t.string   "inside_image_file_name"
    t.string   "inside_image_content_type"
    t.integer  "inside_image_file_size"
    t.datetime "inside_image_updated_at"
    t.decimal  "wholesale_price"
    t.boolean  "discontinued",              default: false
  end

  create_table "guitar_string_bracelets", force: :cascade do |t|
    t.string   "code"
    t.string   "description"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.decimal  "wholesale_price"
    t.boolean  "discontinued",       default: false
  end

  create_table "led_pictures", force: :cascade do |t|
    t.string   "code"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "gif_file_name"
    t.string   "gif_content_type"
    t.integer  "gif_file_size"
    t.datetime "gif_updated_at"
    t.string   "title"
    t.decimal  "wholesale_price"
    t.boolean  "discontinued",       default: false
    t.boolean  "horizontal"
    t.string   "type"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
  end

end
