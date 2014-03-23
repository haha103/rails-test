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

ActiveRecord::Schema.define(version: 20140323141304) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bank_accounts", force: true do |t|
    t.string   "account"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bank_card_type_id"
    t.integer  "bank_id"
  end

  add_index "bank_accounts", ["bank_card_type_id"], name: "index_bank_accounts_on_bank_card_type_id", using: :btree
  add_index "bank_accounts", ["bank_id"], name: "index_bank_accounts_on_bank_id", using: :btree

  create_table "bank_branches", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "province_id"
    t.integer  "city_id"
    t.integer  "bank_id"
  end

  add_index "bank_branches", ["bank_id"], name: "index_bank_branches_on_bank_id", using: :btree
  add_index "bank_branches", ["city_id"], name: "index_bank_branches_on_city_id", using: :btree
  add_index "bank_branches", ["province_id"], name: "index_bank_branches_on_province_id", using: :btree

  create_table "bank_card_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "banks", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "banks", ["name"], name: "index_banks_on_name", unique: true, using: :btree

  create_table "cities", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "province_id"
  end

  add_index "cities", ["province_id"], name: "index_cities_on_province_id", using: :btree

  create_table "districts", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "city_id"
  end

  add_index "districts", ["city_id"], name: "index_districts_on_city_id", using: :btree

  create_table "provinces", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
