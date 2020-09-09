# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_09_033318) do

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

  create_table "albums", force: :cascade do |t|
    t.integer "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_albums_on_product_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "replay"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "product_id"
    t.integer "profile_id"
    t.index ["product_id"], name: "index_comments_on_product_id"
    t.index ["profile_id"], name: "index_comments_on_profile_id"
  end

  create_table "log_comments", force: :cascade do |t|
    t.string "private_message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "trading_log_id"
    t.integer "profile_id"
    t.index ["profile_id"], name: "index_log_comments_on_profile_id"
    t.index ["trading_log_id"], name: "index_log_comments_on_trading_log_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "item_desc"
    t.decimal "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "token"
    t.integer "profile_id"
    t.integer "status"
    t.index ["profile_id"], name: "index_products_on_profile_id"
    t.index ["token"], name: "index_products_on_token", unique: true
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.string "sector"
    t.string "region"
    t.string "company"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.string "email"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "trading_logs", force: :cascade do |t|
    t.string "trade_log"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "seller_id"
    t.integer "profile_id"
    t.integer "product_id"
    t.integer "status", default: 0
    t.index ["product_id"], name: "index_trading_logs_on_product_id"
    t.index ["profile_id"], name: "index_trading_logs_on_profile_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "albums", "products"
  add_foreign_key "comments", "products"
  add_foreign_key "comments", "profiles"
  add_foreign_key "log_comments", "profiles"
  add_foreign_key "log_comments", "trading_logs"
  add_foreign_key "products", "profiles"
  add_foreign_key "profiles", "users"
  add_foreign_key "trading_logs", "products"
  add_foreign_key "trading_logs", "profiles"
end
