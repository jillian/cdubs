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

ActiveRecord::Schema.define(version: 20170804233531) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", id: :serial, force: :cascade do |t|
    t.string "first_name"
    t.text "last_name"
    t.integer "phone"
    t.text "medical_info"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "doses", id: :serial, force: :cascade do |t|
    t.integer "nutrient_id"
    t.integer "formula_id"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["formula_id"], name: "index_doses_on_formula_id"
    t.index ["nutrient_id"], name: "index_doses_on_nutrient_id"
  end

  create_table "formulas", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "client_id"
    t.date "order_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_formulas_on_client_id"
  end

  create_table "nutrients", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "pn_id"
    t.string "unit"
    t.float "pn_ppu"
    t.integer "uti"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "step"
    t.decimal "minimum"
    t.integer "maximum"
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "phone_number"
    t.date "dob"
    t.string "hicn"
    t.string "medi_cal_number"
    t.string "gender", limit: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "doses", "formulas"
  add_foreign_key "doses", "nutrients"
  add_foreign_key "formulas", "clients"
end
