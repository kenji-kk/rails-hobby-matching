# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_01_05_091635) do

  create_table "group_chats", force: :cascade do |t|
    t.integer "hobby_room_id", null: false
    t.string "name"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hobby_room_id"], name: "index_group_chats_on_hobby_room_id"
  end

  create_table "hobby_room_users", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "hobby_room_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hobby_room_id"], name: "index_hobby_room_users_on_hobby_room_id"
    t.index ["user_id"], name: "index_hobby_room_users_on_user_id"
  end

  create_table "hobby_rooms", force: :cascade do |t|
    t.string "genre"
    t.string "title"
    t.text "description"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_hobby_rooms_on_user_id"
  end

  create_table "replies", force: :cascade do |t|
    t.text "content"
    t.string "name"
    t.integer "group_chat_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_chat_id"], name: "index_replies_on_group_chat_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.text "bio"
    t.string "remember_digest"
  end

  add_foreign_key "group_chats", "hobby_rooms"
  add_foreign_key "hobby_room_users", "hobby_rooms"
  add_foreign_key "hobby_room_users", "users"
  add_foreign_key "hobby_rooms", "users"
  add_foreign_key "replies", "group_chats"
end
