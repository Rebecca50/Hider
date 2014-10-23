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

ActiveRecord::Schema.define(version: 20141023181752) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "url_slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_posts", id: false, force: true do |t|
    t.integer "post_id"
    t.integer "category_id"
  end

  create_table "monologue_posts", force: true do |t|
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "title"
    t.text     "content"
    t.string   "url"
    t.datetime "published_at"
  end

  add_index "monologue_posts", ["url"], name: "index_monologue_posts_on_url", unique: true, using: :btree

  create_table "monologue_taggings", force: true do |t|
    t.integer "post_id"
    t.integer "tag_id"
  end

  add_index "monologue_taggings", ["post_id"], name: "index_monologue_taggings_on_post_id", using: :btree
  add_index "monologue_taggings", ["tag_id"], name: "index_monologue_taggings_on_tag_id", using: :btree

  create_table "monologue_tags", force: true do |t|
    t.string "name"
  end

  add_index "monologue_tags", ["name"], name: "index_monologue_tags_on_name", using: :btree

  create_table "monologue_users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

end
