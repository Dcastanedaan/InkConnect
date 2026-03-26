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

ActiveRecord::Schema[8.1].define(version: 2026_03_18_024555) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.bigint "portfolio_id", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["portfolio_id"], name: "index_comments_on_portfolio_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "portfolio_id", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["portfolio_id"], name: "index_likes_on_portfolio_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "portfolio_media", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "image_url"
    t.string "media_type"
    t.bigint "portfolio_id", null: false
    t.datetime "updated_at", null: false
    t.string "youtube_url"
    t.index ["portfolio_id"], name: "index_portfolio_media_on_portfolio_id"
  end

  create_table "portfolio_styles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "portfolio_id", null: false
    t.bigint "tattoo_style_id", null: false
    t.datetime "updated_at", null: false
    t.index ["portfolio_id"], name: "index_portfolio_styles_on_portfolio_id"
    t.index ["tattoo_style_id"], name: "index_portfolio_styles_on_tattoo_style_id"
  end

  create_table "portfolios", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.bigint "tattoo_artist_id", null: false
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["tattoo_artist_id"], name: "index_portfolios_on_tattoo_artist_id"
  end

  create_table "tattoo_artists", force: :cascade do |t|
    t.text "bio"
    t.datetime "created_at", null: false
    t.decimal "hourly_rate"
    t.string "instagram"
    t.string "location"
    t.string "studio_name"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.string "website"
    t.index ["user_id"], name: "index_tattoo_artists_on_user_id"
  end

  create_table "tattoo_styles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "tests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "avatar_url"
    t.text "bio"
    t.datetime "created_at", null: false
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "location"
    t.string "name"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.integer "role", default: 0
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "portfolios"
  add_foreign_key "comments", "users"
  add_foreign_key "likes", "portfolios"
  add_foreign_key "likes", "users"
  add_foreign_key "portfolio_media", "portfolios"
  add_foreign_key "portfolio_styles", "portfolios"
  add_foreign_key "portfolio_styles", "tattoo_styles"
  add_foreign_key "portfolios", "tattoo_artists"
  add_foreign_key "tattoo_artists", "users"
end
