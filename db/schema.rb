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

ActiveRecord::Schema.define(version: 2019_12_20_014709) do

  create_table "dms", force: :cascade do |t|
    t.integer "user1"
    t.integer "user2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "passive_user"
    t.integer "active_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "active_user_name"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "room_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "user_name"
    t.string "ps_id"
    t.string "first_position"
    t.string "second_position"
    t.string "third_position"
    t.string "attendance"
    t.string "time_zone"
    t.string "vc"
    t.string "ligue"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "time_zone_rear"
  end

  create_table "publics", force: :cascade do |t|
    t.string "name"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "password"
    t.string "email"
  end

end
