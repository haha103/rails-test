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

ActiveRecord::Schema.define(version: 20140323235815) do

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

  create_table "borrowers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "emails", force: true do |t|
    t.string   "addr"
    t.boolean  "primary"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "activated"
  end

  add_index "emails", ["user_id"], name: "index_emails_on_user_id", using: :btree

  create_table "guarantee_companies", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guarantees", force: true do |t|
    t.string   "contract_code"
    t.string   "letter_code"
    t.string   "letter_scan"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "guarantee_company_id"
    t.integer  "product_id"
  end

  add_index "guarantees", ["guarantee_company_id"], name: "index_guarantees_on_guarantee_company_id", using: :btree
  add_index "guarantees", ["product_id"], name: "index_guarantees_on_product_id", using: :btree

  create_table "phones", force: true do |t|
    t.string   "number"
    t.boolean  "mobile"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "activated"
  end

  add_index "phones", ["user_id"], name: "index_phones_on_user_id", using: :btree

  create_table "product_statuses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.integer  "target_amount"
    t.integer  "target_amount_min"
    t.float    "interest_platform"
    t.float    "interest_investor"
    t.date     "invest_start"
    t.date     "invest_end"
    t.date     "refund_date"
    t.string   "purpose_summary"
    t.text     "purpose_detail"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "borrower_id"
    t.integer  "refund_type_id"
    t.integer  "product_status_id"
  end

  add_index "products", ["borrower_id"], name: "index_products_on_borrower_id", using: :btree
  add_index "products", ["product_status_id"], name: "index_products_on_product_status_id", using: :btree
  add_index "products", ["refund_type_id"], name: "index_products_on_refund_type_id", using: :btree

  create_table "provinces", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "refund_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.string   "name_en"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", id: false, force: true do |t|
    t.integer "user_id", null: false
    t.integer "role_id", null: false
  end

  create_table "users", force: true do |t|
    t.string   "user_name"
    t.string   "name"
    t.string   "id_num"
    t.string   "login_pass"
    t.string   "pay_pass"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
