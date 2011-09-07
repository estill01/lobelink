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

ActiveRecord::Schema.define(:version => 20110905025627) do

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
    t.string    "position"
    t.text      "explanation"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "user_id"
    t.string    "issue"
  end

  add_index "policies", ["user_id"], :name => "index_policies_on_user_id"

  create_table "users", :force => true do |t|
    t.string    "username"
    t.string    "email"
    t.string    "password_hash"
    t.string    "password_salt"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email"

end
