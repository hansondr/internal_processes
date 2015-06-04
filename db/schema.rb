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

ActiveRecord::Schema.define(version: 20150604222615) do

  create_table "user_data_companies", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_data_departments", force: :cascade do |t|
    t.integer  "company_id",  null: false
    t.string   "name",        null: false
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "user_data_departments", ["company_id"], name: "index_user_data_departments_on_company_id"

  create_table "user_data_team_users", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "user_id"
    t.boolean  "manager",    default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "user_data_team_users", ["team_id"], name: "index_user_data_team_users_on_team_id"
  add_index "user_data_team_users", ["user_id"], name: "index_user_data_team_users_on_user_id"

  create_table "user_data_teams", force: :cascade do |t|
    t.integer  "department_id"
    t.string   "name",          null: false
    t.string   "description",   null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "user_data_teams", ["department_id"], name: "index_user_data_teams_on_department_id"

  create_table "user_data_users", force: :cascade do |t|
    t.string   "first_name", null: false
    t.string   "last_name",  null: false
    t.string   "email",      null: false
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
