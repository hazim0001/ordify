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

ActiveRecord::Schema.define(version: 2020_11_24_001113) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cusines", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
  end

  create_table "line_items", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "menu_items", force: :cascade do |t|
    t.string "title"
    t.float "item_price", default: 0.0
    t.text "description"
    t.bigint "restaurant_id", null: false
    t.bigint "category_id", null: false
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_menu_items_on_category_id"
    t.index ["restaurant_id"], name: "index_menu_items_on_restaurant_id"
  end

  create_table "orders", force: :cascade do |t|
    t.float "total_price", default: 0.0
    t.boolean "dispatched", default: false
    t.bigint "table_id", null: false
    t.string "user_number"
    t.boolean "sent", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["table_id"], name: "index_orders_on_table_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.bigint "cusine_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cusine_id"], name: "index_restaurants_on_cusine_id"
  end

  create_table "tables", force: :cascade do |t|
    t.string "name"
    t.bigint "restaurant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_tables_on_restaurant_id"
  end

  add_foreign_key "menu_items", "categories"
  add_foreign_key "menu_items", "restaurants"
  add_foreign_key "orders", "tables"
  add_foreign_key "restaurants", "cusines"
  add_foreign_key "tables", "restaurants"
end
