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

ActiveRecord::Schema.define(:version => 20111106213351) do

  create_table "chats", :force => true do |t|
    t.integer  "member_id"
    t.integer  "rep_id"
    t.text     "message"
    t.integer  "community_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "chats", ["member_id"], :name => "index_chats_on_member_id"
  add_index "chats", ["rep_id"], :name => "index_chats_on_rep_id"

  create_table "communities", :force => true do |t|
    t.string   "name",              :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.text     "description"
  end

  create_table "communities_members", :force => true do |t|
    t.integer "community_id"
    t.integer "member_id"
  end

  create_table "members", :force => true do |t|
    t.string   "user_name"
    t.string   "email"
    t.boolean  "moderator"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "questions", :force => true do |t|
    t.integer  "community_id"
    t.integer  "member_id"
    t.text     "content"
    t.string   "title"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "responses", :force => true do |t|
    t.integer  "respondable_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "member_id"
    t.string   "respondable_type"
  end

  create_table "suggestions", :force => true do |t|
    t.integer  "community_id"
    t.integer  "member_id"
    t.text     "content"
    t.string   "title"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
