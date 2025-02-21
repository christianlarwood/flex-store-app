# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_02_20_190946) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cart_items", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.bigint "item_id", null: false
    t.bigint "promotion_id"
    t.integer "price_cents"
    t.integer "quantity"
    t.decimal "weight", precision: 6, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["item_id"], name: "index_cart_items_on_item_id"
    t.index ["promotion_id"], name: "index_cart_items_on_promotion_id"
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "price_cents"
    t.string "unit_type"
    t.integer "unit_quantity"
    t.string "unit_of_measurement"
    t.bigint "category_id", null: false
    t.bigint "brand_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_items_on_brand_id"
    t.index ["category_id"], name: "index_items_on_category_id"
  end

  create_table "promotions", force: :cascade do |t|
    t.string "name"
    t.string "promotion_type"
    t.integer "discount_percentage"
    t.integer "discount_cents"
    t.integer "x_quantity"
    t.integer "y_quantity"
    t.string "promotable_type"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "weight_threshold"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "promotable_id", null: false
    t.index ["promotable_id"], name: "index_promotions_on_promotable_id"
  end

  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "items"
  add_foreign_key "cart_items", "promotions"
  add_foreign_key "items", "brands"
  add_foreign_key "items", "categories"
end
