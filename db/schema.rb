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

ActiveRecord::Schema[7.0].define(version: 2022_07_13_071450) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_lists", force: :cascade do |t|
    t.integer "order_id"
    t.integer "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "staff_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "customer"
    t.integer "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "machine"
    t.string "reg_number"
    t.string "telephone"
    t.string "status"
    t.string "start_date"
    t.integer "worktime"
  end

  create_table "services", force: :cascade do |t|
    t.string "title"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "categories_id"
    t.integer "worktime"
    t.index ["categories_id"], name: "index_services_on_categories_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.string "surname"
    t.string "name"
    t.string "specialization"
    t.integer "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "services", "categories", column: "categories_id"
end
