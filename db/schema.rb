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

ActiveRecord::Schema.define(version: 2019_12_11_144438) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string "email"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.boolean "read"
  end

  create_table "images", force: :cascade do |t|
    t.bigint "media_id"
    t.bigint "issue_id"
    t.bigint "user_id"
    t.boolean "primary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["issue_id"], name: "index_images_on_issue_id"
    t.index ["media_id"], name: "index_images_on_media_id"
    t.index ["user_id"], name: "index_images_on_user_id"
  end

  create_table "issues", force: :cascade do |t|
    t.string "title"
    t.string "cover_image"
    t.integer "issue_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "byline"
  end

  create_table "medias", force: :cascade do |t|
    t.string "title"
    t.boolean "published"
    t.integer "minutes"
    t.datetime "date_published"
    t.text "blurb"
    t.text "content"
    t.string "cover_image"
    t.bigint "issue_id"
    t.string "video_url"
    t.string "audio_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "media_type"
    t.index ["issue_id"], name: "index_medias_on_issue_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.string "avatar"
    t.text "bio"
    t.text "byline"
    t.string "website"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_medias", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "media_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["media_id"], name: "index_users_medias_on_media_id"
    t.index ["user_id"], name: "index_users_medias_on_user_id"
  end

  add_foreign_key "images", "issues"
  add_foreign_key "images", "medias"
  add_foreign_key "images", "users"
  add_foreign_key "medias", "issues"
  add_foreign_key "users_medias", "medias"
  add_foreign_key "users_medias", "users"
end
