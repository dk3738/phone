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

ActiveRecord::Schema.define(version: 2020_12_05_082919) do

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "comcomments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "company_id"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_comcomments_on_company_id"
    t.index ["user_id"], name: "index_comcomments_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "online_id", null: false
    t.integer "user_id", null: false
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["online_id"], name: "index_comments_on_online_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "title"
    t.text "description"
    t.integer "view"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.index ["user_id"], name: "index_companies_on_user_id"
    t.index ["view"], name: "index_companies_on_view"
  end

  create_table "freecomments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "free_id", null: false
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["free_id"], name: "index_freecomments_on_free_id"
    t.index ["user_id"], name: "index_freecomments_on_user_id"
  end

  create_table "frees", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "title"
    t.text "description"
    t.integer "view_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.index ["user_id"], name: "index_frees_on_user_id"
    t.index ["view_count"], name: "index_frees_on_view_count"
  end

  create_table "homes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "company_id", null: false
    t.integer "online_id", null: false
    t.integer "free_id", null: false
    t.integer "share_id", null: false
    t.integer "review_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_homes_on_company_id"
    t.index ["free_id"], name: "index_homes_on_free_id"
    t.index ["online_id"], name: "index_homes_on_online_id"
    t.index ["review_id"], name: "index_homes_on_review_id"
    t.index ["share_id"], name: "index_homes_on_share_id"
    t.index ["user_id"], name: "index_homes_on_user_id"
  end

  create_table "onlines", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "title"
    t.text "description"
    t.integer "view_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "file"
    t.string "image"
    t.index ["user_id"], name: "index_onlines_on_user_id"
    t.index ["view_count"], name: "index_onlines_on_view_count"
  end

  create_table "reviewcomments", force: :cascade do |t|
    t.text "content"
    t.integer "user_id", null: false
    t.integer "review_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["review_id"], name: "index_reviewcomments_on_review_id"
    t.index ["user_id"], name: "index_reviewcomments_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "title"
    t.string "image"
    t.text "description"
    t.integer "view_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_reviews_on_user_id"
    t.index ["view_count"], name: "index_reviews_on_view_count"
  end

  create_table "sharecomments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "share_id", null: false
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["share_id"], name: "index_sharecomments_on_share_id"
    t.index ["user_id"], name: "index_sharecomments_on_user_id"
  end

  create_table "shares", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "title"
    t.string "image"
    t.text "description"
    t.integer "view_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_shares_on_user_id"
    t.index ["view_count"], name: "index_shares_on_view_count"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.integer "status", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "onlines"
  add_foreign_key "comments", "users"
  add_foreign_key "companies", "users"
  add_foreign_key "freecomments", "frees"
  add_foreign_key "freecomments", "users"
  add_foreign_key "frees", "users"
  add_foreign_key "homes", "companies"
  add_foreign_key "homes", "frees"
  add_foreign_key "homes", "onlines"
  add_foreign_key "homes", "reviews"
  add_foreign_key "homes", "shares"
  add_foreign_key "homes", "users"
  add_foreign_key "onlines", "users"
  add_foreign_key "reviewcomments", "reviews"
  add_foreign_key "reviewcomments", "users"
  add_foreign_key "reviews", "users"
  add_foreign_key "sharecomments", "shares"
  add_foreign_key "sharecomments", "users"
  add_foreign_key "shares", "users"
end
