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

ActiveRecord::Schema.define(version: 2019_10_01_202957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "message"
    t.integer "user_id"
    t.integer "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_comments_on_place_id"
    t.index ["user_id", "place_id"], name: "index_comments_on_user_id_and_place_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "image"
    t.integer "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_photos_on_place_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.bigint "phone_number"
    t.text "description"
    t.string "images"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "image"
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_places_on_user_id"
  end

  create_table "saves", force: :cascade do |t|
    t.string "saveable_type"
    t.bigint "saveable_id"
    t.string "saver_type"
    t.bigint "saver_id"
    t.boolean "save_flag"
    t.string "save_scope"
    t.integer "save_weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["saveable_id", "saveable_type", "save_scope"], name: "index_saves_on_saveable_id_and_saveable_type_and_save_scope"
    t.index ["saveable_type", "saveable_id"], name: "index_saves_on_saveable_type_and_saveable_id"
    t.index ["saver_id", "saver_type", "save_scope"], name: "index_saves_on_saver_id_and_saver_type_and_save_scope"
    t.index ["saver_type", "saver_id"], name: "index_saves_on_saver_type_and_saver_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["provider"], name: "index_users_on_provider"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid"], name: "index_users_on_uid"
  end

end
