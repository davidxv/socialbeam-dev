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

ActiveRecord::Schema.define(:version => 20131119182209) do

  create_table "authorizations", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "friendships", :force => true do |t|
    t.string   "beamer_id"
    t.string   "friend_beamer_id"
    t.string   "status"
    t.datetime "created_at"
  end

  create_table "messages", :force => true do |t|
    t.string   "subject"
    t.text     "body"
    t.integer  "user_id"
    t.string   "ancestry"
    t.string   "recipient_ids"
    t.datetime "sent_at"
    t.datetime "received_at"
    t.datetime "read_at"
    t.datetime "trashed_at"
    t.datetime "deleted_at"
    t.boolean  "editable",      :default => true
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "messages", ["ancestry"], :name => "index_messages_on_ancestry"
  add_index "messages", ["user_id"], :name => "index_messages_on_user_id"

  create_table "newsfeeds", :force => true do |t|
    t.string   "verb"
    t.string   "activity"
    t.string   "actor_id"
    t.string   "actor_type"
    t.string   "actor_name_method"
    t.string   "indirect_actor_id"
    t.string   "indirect_actor_type"
    t.string   "indirect_actor_name_method"
    t.integer  "count",                      :default => 1
    t.string   "object_id"
    t.string   "object_type"
    t.string   "object_name_method"
    t.integer  "privacystatus",              :default => 0
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "scribble_comments", :force => true do |t|
    t.string   "commentor_id"
    t.string   "commentor"
    t.text     "body",                        :null => false
    t.integer  "ups",          :default => 0
    t.integer  "downs",        :default => 0
    t.string   "scribble_id"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "scribbles", :force => true do |t|
    t.string   "post"
    t.string   "posted_by"
    t.string   "posted_by_uid"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "ups"
    t.integer  "downs"
    t.string   "scribble_id",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",               :default => "",       :null => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "profile_name",        :default => "beamer"
    t.string   "profile_id",                                :null => false
    t.string   "beamer_id",                                 :null => false
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "single_access_token"
    t.integer  "login_count",         :default => 0
    t.integer  "failed_login_count",  :default => 0
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.text     "omniauth_data"
  end

  add_index "users", ["beamer_id"], :name => "index_users_on_beamer_id", :unique => true
  add_index "users", ["first_name"], :name => "index_users_on_first_name"
  add_index "users", ["profile_id"], :name => "index_users_on_profile_id", :unique => true

end
