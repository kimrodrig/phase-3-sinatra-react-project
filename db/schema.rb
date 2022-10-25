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

ActiveRecord::Schema.define(version: 2022_10_25_145217) do

  create_table "areas", force: :cascade do |t|
    t.integer "zipcode"
    t.string "adjacent_zipcodes"
  end

  create_table "areas_supermarkets", id: false, force: :cascade do |t|
    t.integer "area_id", null: false
    t.integer "supermarket_id", null: false
  end

  create_table "commodities", force: :cascade do |t|
    t.integer "supermarket_id"
    t.string "name"
    t.string "amount"
    t.float "price"
  end

  create_table "supermarkets", force: :cascade do |t|
    t.string "name"
    t.integer "zipcode"
    t.float "price_index"
  end

end
