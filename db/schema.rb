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

ActiveRecord::Schema.define(version: 2020_12_27_090822) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
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

  create_table "add_extras", force: :cascade do |t|
    t.bigint "line_item_id", null: false
    t.bigint "extra_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "add_extra_created_at"
    t.datetime "add_extra_updated_at"
    t.index ["extra_id"], name: "index_add_extras_on_extra_id"
    t.index ["line_item_id"], name: "index_add_extras_on_line_item_id"
  end

  create_table "blazer_audits", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "query_id"
    t.text "statement"
    t.string "data_source"
    t.datetime "created_at"
    t.index ["query_id"], name: "index_blazer_audits_on_query_id"
    t.index ["user_id"], name: "index_blazer_audits_on_user_id"
  end

  create_table "blazer_checks", force: :cascade do |t|
    t.bigint "creator_id"
    t.bigint "query_id"
    t.string "state"
    t.string "schedule"
    t.text "emails"
    t.text "slack_channels"
    t.string "check_type"
    t.text "message"
    t.datetime "last_run_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creator_id"], name: "index_blazer_checks_on_creator_id"
    t.index ["query_id"], name: "index_blazer_checks_on_query_id"
  end

  create_table "blazer_dashboard_queries", force: :cascade do |t|
    t.bigint "dashboard_id"
    t.bigint "query_id"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dashboard_id"], name: "index_blazer_dashboard_queries_on_dashboard_id"
    t.index ["query_id"], name: "index_blazer_dashboard_queries_on_query_id"
  end

  create_table "blazer_dashboards", force: :cascade do |t|
    t.bigint "creator_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creator_id"], name: "index_blazer_dashboards_on_creator_id"
  end

  create_table "blazer_queries", force: :cascade do |t|
    t.bigint "creator_id"
    t.string "name"
    t.text "description"
    t.text "statement"
    t.string "data_source"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creator_id"], name: "index_blazer_queries_on_creator_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "restaurant_id"
    t.integer "menu_items_count", default: 0
    t.index ["restaurant_id"], name: "index_categories_on_restaurant_id"
  end

  create_table "cusines", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", default: "", null: false
    t.string "role", default: "", null: false
    t.bigint "restaurant_id", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.integer "salary"
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
    t.index ["restaurant_id"], name: "index_employees_on_restaurant_id"
  end

  create_table "extras", force: :cascade do |t|
    t.string "title"
    t.integer "size_grams"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "extra_price_cents", default: 0, null: false
    t.boolean "active_extra", default: true
    t.bigint "ingredient_inventory_id"
    t.index ["ingredient_inventory_id"], name: "index_extras_on_ingredient_inventory_id"
  end

  create_table "ingredient_inventories", force: :cascade do |t|
    t.integer "stock_amount_grams", default: 0
    t.integer "trigger_limit", default: 0
    t.string "name"
    t.string "vendor_name"
    t.string "vendor_phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "title"
    t.integer "ingredient_portion_size_grams", default: 0
    t.bigint "menu_item_id", null: false
    t.bigint "ingredient_inventory_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ingredient_inventory_id"], name: "index_ingredients_on_ingredient_inventory_id"
    t.index ["menu_item_id"], name: "index_ingredients_on_menu_item_id"
  end

  # to be removed
  create_table "inventories", force: :cascade do |t|
    t.integer "stock_amount_grams"
    t.integer "trigger_limit"
    t.bigint "menu_item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["menu_item_id"], name: "index_inventories_on_menu_item_id"
  end

  create_table "inventory_refills", force: :cascade do |t|
    t.integer "refill_amount", default: 0
    t.bigint "ingredient_inventory_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "inventory_refill_created_at"
    t.datetime "inventory_refill_updated_at"
    t.index ["ingredient_inventory_id"], name: "index_inventory_refills_on_ingredient_inventory_id"
  end

  create_table "line_items", force: :cascade do |t|
    t.text "comment", default: ""
    t.integer "quantity", default: 1
    t.boolean "ordered", default: false
    t.boolean "dispatched_from_kitchen", default: false
    t.bigint "order_id", null: false
    t.bigint "menu_item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "total_cents", default: 0, null: false
    t.datetime "received_at"
    t.datetime "dispatched_at"
    t.float "total_kitchen_time", default: 0.0
    t.boolean "deleted", default: false
    t.string "deleted_by"
    t.datetime "deleted_at"
    t.text "line_deletion_reason"
    t.datetime "line_item_created_at"
    t.datetime "line_item_updated_at"
    t.index ["menu_item_id"], name: "index_line_items_on_menu_item_id"
    t.index ["order_id"], name: "index_line_items_on_order_id"
  end

  create_table "menu_items", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "restaurant_id", null: false
    t.bigint "category_id", null: false
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "item_price_cents", default: 0, null: false
    t.integer "portion_size_grams", default: 0
    t.boolean "accepts_extra", default: true
    t.index ["category_id"], name: "index_menu_items_on_category_id"
    t.index ["restaurant_id"], name: "index_menu_items_on_restaurant_id"
  end

  create_table "orders", force: :cascade do |t|
    t.boolean "dispatched", default: false
    t.bigint "table_id", null: false
    t.string "user_number"
    t.boolean "sent", default: false
    t.string "status", default: "not paid"
    t.string "checkout_session_id", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "total_price_cents", default: 0, null: false
    t.boolean "order_deleted", default: false
    t.string "order_deleted_by"
    t.datetime "order_deleted_at"
    t.text "deletion_reason"
    t.integer "from_order_to_checkout"
    t.datetime "order_created_at"
    t.datetime "order_updated_at"
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "add_extras", "extras"
  add_foreign_key "add_extras", "line_items"
  add_foreign_key "categories", "restaurants"
  add_foreign_key "employees", "restaurants"
  add_foreign_key "extras", "ingredient_inventories"
  add_foreign_key "ingredients", "ingredient_inventories"
  add_foreign_key "ingredients", "menu_items"
  add_foreign_key "inventories", "menu_items"
  add_foreign_key "inventory_refills", "ingredient_inventories"
  add_foreign_key "line_items", "menu_items"
  add_foreign_key "line_items", "orders"
  add_foreign_key "menu_items", "categories"
  add_foreign_key "menu_items", "restaurants"
  add_foreign_key "orders", "tables"
  add_foreign_key "restaurants", "cusines"
  add_foreign_key "tables", "restaurants"
end
