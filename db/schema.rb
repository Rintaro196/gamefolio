# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_11_22_035804) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "game_genres", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "genre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id", "genre_id"], name: "index_game_genres_on_game_id_and_genre_id", unique: true
    t.index ["game_id"], name: "index_game_genres_on_game_id"
    t.index ["genre_id"], name: "index_game_genres_on_genre_id"
  end

  create_table "game_logs", force: :cascade do |t|
    t.string "title", null: false
    t.text "body"
    t.integer "play_time"
    t.integer "spending_amount"
    t.bigint "user_id", null: false
    t.bigint "user_game_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_game_id"], name: "index_game_logs_on_user_game_id"
    t.index ["user_id"], name: "index_game_logs_on_user_id"
  end

  create_table "game_platforms", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "platform_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id", "platform_id"], name: "index_game_platforms_on_game_id_and_platform_id", unique: true
    t.index ["game_id"], name: "index_game_platforms_on_game_id"
    t.index ["platform_id"], name: "index_game_platforms_on_platform_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "game_title", null: false
    t.string "cover_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "igdb_id"
    t.index ["igdb_id"], name: "index_games_on_igdb_id", unique: true
  end

  create_table "genres", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_genres_on_name", unique: true
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "game_log_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_log_id"], name: "index_likes_on_game_log_id"
    t.index ["user_id", "game_log_id"], name: "index_likes_on_user_id_and_game_log_id", unique: true
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "platforms", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_platforms_on_name", unique: true
  end

  create_table "tokens", force: :cascade do |t|
    t.string "access_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_games", force: :cascade do |t|
    t.integer "status", limit: 2, default: 0, null: false
    t.bigint "user_id", null: false
    t.bigint "game_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "memo"
    t.index ["game_id"], name: "index_user_games_on_game_id"
    t.index ["user_id", "game_id"], name: "index_user_games_on_user_id_and_game_id", unique: true
    t.index ["user_id"], name: "index_user_games_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "name", null: false
    t.string "user_code", null: false
    t.integer "age"
    t.integer "gender", limit: 2
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "profile"
    t.string "twitter"
    t.string "twitch"
    t.string "discord"
    t.integer "level", default: 1, null: false
    t.integer "gem", default: 0, null: false
    t.datetime "last_level_up_by_log"
    t.index ["discord"], name: "index_users_on_discord", unique: true, where: "(discord IS NOT NULL)"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["twitch"], name: "index_users_on_twitch", unique: true, where: "(twitch IS NOT NULL)"
    t.index ["twitter"], name: "index_users_on_twitter", unique: true, where: "(twitter IS NOT NULL)"
    t.index ["user_code"], name: "index_users_on_user_code", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "game_genres", "games"
  add_foreign_key "game_genres", "genres"
  add_foreign_key "game_logs", "user_games"
  add_foreign_key "game_logs", "users"
  add_foreign_key "game_platforms", "games"
  add_foreign_key "game_platforms", "platforms"
  add_foreign_key "likes", "game_logs"
  add_foreign_key "likes", "users"
  add_foreign_key "user_games", "games"
  add_foreign_key "user_games", "users"
end
