ActiveRecord::Schema.define(version: 20160409215035) do

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
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "gender"
    t.datetime "dob"
    t.string   "location"
    t.string   "preference"
    t.string   "photos"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email"
    t.string   "status"
  end

end
