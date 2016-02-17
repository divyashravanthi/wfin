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

ActiveRecord::Schema.define(version: 20160217001928) do

  create_table "recruits", force: :cascade do |t|
    t.integer  "user_id",           limit: 4
    t.integer  "recruited_user_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "recruits", ["recruited_user_id"], name: "index_recruits_on_recruited_user_id", using: :btree
  add_index "recruits", ["user_id", "recruited_user_id"], name: "index_recruits_on_user_id_and_recruited_user_id", unique: true, using: :btree
  add_index "recruits", ["user_id"], name: "index_recruits_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",     null: false
    t.string   "encrypted_password",     limit: 255, default: "",     null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "phone_number",           limit: 255
    t.datetime "date_of_birth"
    t.string   "gender",                 limit: 255, default: "Male", null: false
    t.string   "name_of_sponsor",        limit: 255
    t.datetime "date_registered"
    t.boolean  "is_admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "recruits", "users"
  add_foreign_key "recruits", "users", column: "recruited_user_id"
end
