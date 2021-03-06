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

ActiveRecord::Schema.define(version: 20140626130600) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.string   "comment",    limit: 1500
    t.integer  "recipe_id"
    t.integer  "user_id"
    t.string   "username"
    t.string   "user_image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "days", force: true do |t|
    t.string   "day"
    t.integer  "week_id"
    t.string   "recipe_name", limit: 100
    t.string   "description", limit: 110
    t.string   "tags",        limit: 30
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fav_recipes", force: true do |t|
    t.string   "recipe_name", limit: 100
    t.string   "description", limit: 110
    t.string   "preparation", limit: 2000
    t.string   "tags",        limit: 30
    t.string   "user",        limit: 30
    t.string   "image"
    t.integer  "servings",                 default: 2
    t.string   "favorite",                 default: "no"
    t.string   "commented",                default: "no"
    t.integer  "rating",                   default: 3
    t.string   "ingredients"
    t.string   "ready_in"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "f_id"
  end

  create_table "posts", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipes", force: true do |t|
    t.string   "recipe_name", limit: 100
    t.string   "description", limit: 110
    t.string   "preparation", limit: 2000
    t.string   "tags",        limit: 30
    t.string   "user",        limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.integer  "servings",                 default: 2
    t.integer  "rating",                   default: 3
    t.string   "ingredients", limit: 1500
    t.string   "favorite",                 default: "no"
    t.string   "commented",                default: "no"
    t.string   "ready_in"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "image"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "weeks", force: true do |t|
    t.string   "week_date"
    t.string   "user"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
