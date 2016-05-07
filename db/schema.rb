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

ActiveRecord::Schema.define(version: 20160507155243) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categorizations", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "talk_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "categorizations", ["category_id"], name: "index_categorizations_on_category_id"
  add_index "categorizations", ["talk_id"], name: "index_categorizations_on_talk_id"

  create_table "likes", force: :cascade do |t|
    t.integer  "talk_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "likes", ["talk_id"], name: "index_likes_on_talk_id"
  add_index "likes", ["user_id"], name: "index_likes_on_user_id"

  create_table "registrations", force: :cascade do |t|
    t.integer  "talk_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.string   "question"
  end

  add_index "registrations", ["talk_id"], name: "index_registrations_on_talk_id"

  create_table "talks", force: :cascade do |t|
    t.string   "title"
    t.string   "speaker"
    t.string   "topic"
    t.datetime "date"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.text     "speaker_profile"
    t.integer  "capacity"
    t.string   "status",          default: "upcoming"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email_address"
    t.string   "password_digest"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "user_type",       default: "new user"
  end

end
