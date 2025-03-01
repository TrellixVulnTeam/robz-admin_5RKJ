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

ActiveRecord::Schema.define(version: 20130925164604) do

  create_table "categories", force: true do |t|
    t.string   "name",                    null: false
    t.text     "description"
    t.integer  "parent",      default: 0
    t.integer  "status",      default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "post_types", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.integer  "category_id"
    t.string   "excerpt",        limit: 140
    t.text     "content"
    t.integer  "status",         limit: 4,   default: 1
    t.integer  "parent",                     default: 0
    t.integer  "post_type",      limit: 4
    t.integer  "comment_status", limit: 4,   default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "link"
    t.string   "refer"
  end

  create_table "user_types", force: true do |t|
    t.string   "name",       null: false
    t.string   "icon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                            default: "", null: false
    t.string   "encrypted_password",               default: "", null: false
    t.string   "username",                         default: "", null: false
    t.integer  "user_type",              limit: 1, default: 3
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                    default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
