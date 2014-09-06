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

ActiveRecord::Schema.define(version: 20140905174901) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", id: false, force: true do |t|
    t.string   "name"
    t.string   "username",        null: false
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

  create_table "companies", id: false, force: true do |t|
    t.string   "name",       null: false
    t.date     "date"
    t.float    "cgpa"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "studentlists", id: false, force: true do |t|
    t.string   "company_name", null: false
    t.integer  "roll_number",  null: false
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", id: false, force: true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "age"
    t.float    "cgpa"
    t.integer  "roll_number",     null: false
    t.string   "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
