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

ActiveRecord::Schema.define(version: 20130822114825) do

  create_table "authentications", force: true do |t|
    t.integer  "user_id",    null: false
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authentications", ["provider", "uid"], name: "index_authentications_on_provider_and_uid", unique: true

  create_table "badges", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

  add_index "badges", ["type"], name: "index_badges_on_type"

  create_table "book_rates", force: true do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.integer  "rate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "book_rates", ["book_id"], name: "index_book_rates_on_book_id"
  add_index "book_rates", ["user_id", "book_id"], name: "index_book_rates_on_user_id_and_book_id", unique: true

  create_table "book_tracks", force: true do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: true do |t|
    t.integer  "user_id"
    t.integer  "season_id"
    t.string   "title"
    t.string   "head"
    t.text     "description"
    t.text     "full_text"
    t.string   "cover"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bookmate_id"
    t.integer  "short_list",  default: 0
  end

  add_index "books", ["short_list"], name: "index_books_on_short_list"

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.text     "text"
    t.integer  "mark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "approved",         default: 0
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "experts", force: true do |t|
    t.string "name"
    t.text   "content"
  end

  create_table "news", force: true do |t|
    t.string   "head"
    t.text     "text",       limit: 255
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.string   "title"
    t.string   "head"
    t.string   "page_alias"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["page_alias"], name: "index_pages_on_page_alias", unique: true

  create_table "presses", force: true do |t|
    t.string   "head"
    t.text     "content"
    t.string   "paper_name"
    t.string   "paper_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "published_on"
    t.text     "abstract"
  end

  add_index "presses", ["published_on"], name: "index_presses_on_published_on"

  create_table "profiles", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: true do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.string   "head"
    t.text     "content"
    t.integer  "approved"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seasons", force: true do |t|
    t.string   "title"
    t.date     "start_on"
    t.date     "end_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscriptions", force: true do |t|
    t.integer  "user_id"
    t.integer  "hour"
    t.integer  "day"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id"

  create_table "tracks", force: true do |t|
    t.integer  "user_id"
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sent",           default: 0
  end

  create_table "user_badges", force: true do |t|
    t.integer  "user_id"
    t.integer  "badge_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",                        null: false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "avatar"
  end

  add_index "users", ["activation_token"], name: "index_users_on_activation_token"
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token"

  create_table "writings", force: true do |t|
    t.string   "head"
    t.text     "content"
    t.string   "paper_name"
    t.string   "paper_url"
    t.date     "published_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "writings", ["published_on"], name: "index_writings_on_published_on"

end
