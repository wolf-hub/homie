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

ActiveRecord::Schema.define(version: 2019_11_22_151917) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "connections", force: :cascade do |t|
    t.integer "property_id"
    t.integer "request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_connections_on_property_id"
    t.index ["request_id"], name: "index_connections_on_request_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recepient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "landlords", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "information"
    t.string "phone_number"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.index ["user_id"], name: "index_landlords_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "context"
    t.integer "user_id"
    t.integer "conversation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "content"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "points", force: :cascade do |t|
    t.integer "user_id"
    t.integer "property_id"
    t.integer "request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_points_on_property_id"
    t.index ["request_id"], name: "index_points_on_request_id"
    t.index ["user_id"], name: "index_points_on_user_id"
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
    t.boolean "active", default: true
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "city"
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "user_id"
    t.integer "request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "property_id"
    t.index ["request_id"], name: "index_purchases_on_request_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "address"
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
    t.string "duration"
    t.date "arrival_date"
    t.integer "min_budget"
    t.integer "max_budget"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active"
    t.string "city"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "tenants", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "information"
    t.string "employment_status"
    t.string "working_place"
    t.integer "from_year"
    t.integer "to_year"
    t.string "credit_score"
    t.string "address"
    t.string "phone_number"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tenants_on_user_id"
  end

  create_table "user_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_user_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_user_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_user_comments_on_resource_type_and_resource_id"
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
    t.string "stripe_id"
    t.integer "unread", default: 0
    t.boolean "admin", default: false
    t.integer "freepoints", default: 5
    t.string "authentication_token", limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
