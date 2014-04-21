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

ActiveRecord::Schema.define(version: 20140421174859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audios", force: true do |t|
    t.string   "subject_file_name"
    t.string   "subject_content_type"
    t.integer  "subject_file_size"
    t.datetime "subject_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "codes", force: true do |t|
    t.string   "subject",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.string   "body",          null: false
    t.integer  "discussion_id", null: false
    t.string   "username",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["discussion_id"], name: "index_comments_on_discussion_id", using: :btree

  create_table "discussions", force: true do |t|
    t.string   "name",                         null: false
    t.integer  "user_id",                      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token",                        null: false
    t.string   "content_type"
    t.integer  "content_id"
    t.boolean  "closed",       default: false
  end

  add_index "discussions", ["content_id", "content_type"], name: "index_discussions_on_content_id_and_content_type", using: :btree

  create_table "documents", force: true do |t|
    t.string   "subject_file_name"
    t.string   "subject_content_type"
    t.integer  "subject_file_size"
    t.datetime "subject_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subject_file_name"
    t.string   "subject_content_type"
    t.integer  "subject_file_size"
    t.datetime "subject_updated_at"
  end

  create_table "users", force: true do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
    t.string   "username",           limit: 20,  null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  create_table "videos", force: true do |t|
    t.string   "subject"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
