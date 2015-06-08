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

ActiveRecord::Schema.define(version: 20150608144422) do

  create_table "oauths", force: :cascade do |t|
    t.string   "user_id"
    t.string   "uid"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string   "case_id"
    t.string   "gender"
    t.integer  "age"
    t.date     "developed"
    t.date     "diagnosed"
    t.string   "contracted_place"
    t.string   "contracted_from"
    t.string   "relationship"
    t.string   "relationship_code"
    t.date     "possible_contracted_date"
    t.integer  "days_to_show"
    t.integer  "days_to_be_diagnosed"
    t.text     "remarks"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "piles", force: :cascade do |t|
    t.string   "title"
    t.string   "original_link"
    t.string   "description"
    t.datetime "posted_date"
    t.string   "author"
    t.string   "publisher"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "uid"
    t.string   "pile_type"
    t.boolean  "curation"
  end

  add_index "piles", ["curation"], name: "index_piles_on_curation"
  add_index "piles", ["pile_type"], name: "index_piles_on_pile_type"
  add_index "piles", ["posted_date"], name: "index_piles_on_posted_date"
  add_index "piles", ["publisher"], name: "index_piles_on_publisher"
  add_index "piles", ["uid"], name: "index_piles_on_uid"

  create_table "users", force: :cascade do |t|
    t.string   "uid"
    t.string   "nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
