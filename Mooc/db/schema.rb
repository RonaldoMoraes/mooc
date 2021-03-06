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

ActiveRecord::Schema.define(version: 20160603192017) do

  create_table "categories", force: :cascade do |t|
    t.string "name",        limit: 255
    t.text   "description", limit: 65535
  end

  create_table "categorizations", force: :cascade do |t|
    t.integer "category_id", limit: 4
    t.integer "user_id",     limit: 4
  end

  add_index "categorizations", ["category_id"], name: "index_categorizations_on_category_id", using: :btree
  add_index "categorizations", ["user_id"], name: "index_categorizations_on_user_id", using: :btree

  create_table "likes", force: :cascade do |t|
    t.integer "user_id",     limit: 4
    t.integer "tutorial_id", limit: 4
  end

  add_index "likes", ["tutorial_id"], name: "index_likes_on_tutorial_id", using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "steps", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "body",        limit: 65535
    t.string   "img_url",     limit: 255
    t.string   "pdf_url",     limit: 255
    t.integer  "tutorial_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "video_url",   limit: 255
  end

  add_index "steps", ["tutorial_id"], name: "index_steps_on_tutorial_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "tutorial_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "students", ["tutorial_id"], name: "index_students_on_tutorial_id", using: :btree
  add_index "students", ["user_id"], name: "index_students_on_user_id", using: :btree

  create_table "tutorials", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.integer  "user_id",     limit: 4
    t.integer  "category_id", limit: 4
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "tutorials", ["category_id"], name: "index_tutorials_on_category_id", using: :btree
  add_index "tutorials", ["user_id"], name: "index_tutorials_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                   limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "categorizations", "categories"
  add_foreign_key "categorizations", "users"
  add_foreign_key "likes", "tutorials"
  add_foreign_key "likes", "users"
  add_foreign_key "steps", "tutorials"
  add_foreign_key "students", "tutorials"
  add_foreign_key "students", "users"
  add_foreign_key "tutorials", "categories"
  add_foreign_key "tutorials", "users"
end
