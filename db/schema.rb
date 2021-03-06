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

ActiveRecord::Schema.define(version: 20160417154748) do

  create_table "citizens", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interests", force: :cascade do |t|
    t.string "interest_name"
  end

  create_table "internationals", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.string   "status"
    t.integer  "citizen_id"
    t.integer  "international_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "content"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "user_interests", force: :cascade do |t|
    t.integer "user_id"
    t.integer "interest_id"
    t.integer "rating"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "gender"
    t.datetime "dob"
    t.string   "location"
    t.string   "preference"
    t.string   "photos"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "email"
    t.string   "status"
    t.string   "password_digest"
    t.string   "password_confirmation"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "minage"
    t.integer  "maxage"
    t.string   "fear"
    t.string   "movie"
    t.string   "book"
    t.string   "bio"
  end

end
