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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110907075748) do

  create_table "comments", :force => true do |t|
    t.text      "content"
    t.integer   "commentable_id"
    t.string    "commentable_type"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "concerns", :force => true do |t|
    t.string    "topic"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "policies", :force => true do |t|
    t.string   "position"
    t.text     "explanation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "issue"
    t.string   "slug"
  end

  add_index "policies", ["user_id", "slug"], :name => "index_policies_on_user_id_and_cached_slug", :unique => true
  add_index "policies", ["user_id"], :name => "index_policies_on_user_id"

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["slug"], :name => "index_users_on_cached_slug", :unique => true

end
