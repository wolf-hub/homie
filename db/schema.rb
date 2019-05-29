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

ActiveRecord::Schema.define(version: 2019_05_25_153859) do

  create_table "landlords", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "information"
    t.string "phone_number"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_landlords_on_user_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "property_name"
    t.integer "price"
    t.string "home_type"
    t.string "room_type"
    t.integer "accommodate"
    t.integer "bed_room"
    t.integer "bath_room"
    t.boolean "is_air"
    t.boolean "is_parking"
    t.boolean "is_washer"
    t.boolean "is_balcony"
    t.boolean "is_fireplace"
    t.boolean "is_internet"
    t.boolean "is_gym"
    t.boolean "is_pool"
    t.boolean "is_dogs"
    t.boolean "is_cats"
    t.boolean "is_wheelchair"
    t.boolean "is_smoking"
    t.string "address"
    t.string "minimum_lease"
    t.text "summary"
    t.boolean "active"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
