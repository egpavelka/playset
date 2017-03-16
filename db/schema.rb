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

ActiveRecord::Schema.define(version: 20170316064958) do

  create_table "embeddeds", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "url_source"
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "track_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["track_id"], name: "index_likes_on_track_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "media_sources", force: :cascade do |t|
    t.string   "media_type"
    t.integer  "media_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "track_id"
    t.index ["media_type", "media_id"], name: "index_media_sources_on_media_type_and_media_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
    t.string   "artist"
    t.string   "album"
    t.string   "year"
    t.index ["user_id", "created_at"], name: "index_tracks_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_tracks_on_user_id"
  end

  create_table "uploads", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "file_source"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "username"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.text     "profile_bio"
    t.boolean  "admin",             default: false
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "videos", force: :cascade do |t|
    t.string   "video_source"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
