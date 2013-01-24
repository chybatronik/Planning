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

ActiveRecord::Schema.define(:version => 20130124124332) do

  create_table "directions", :force => true do |t|
    t.string   "name"
    t.boolean  "active"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "user_id"
    t.boolean  "is_limit"
    t.string   "icon"
    t.integer  "count_limit", :default => 3, :null => false
    t.text     "desc"
  end

  add_index "directions", ["active"], :name => "index_directions_on_active"
  add_index "directions", ["created_at"], :name => "index_directions_on_created_at"
  add_index "directions", ["id"], :name => "index_directions_on_id"
  add_index "directions", ["user_id"], :name => "index_directions_on_user_id"

  create_table "notes", :force => true do |t|
    t.string   "desc"
    t.string   "dir"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  create_table "schedules", :force => true do |t|
    t.integer  "task_id"
    t.boolean  "is_done"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "user_id"
    t.integer  "direction_id"
    t.integer  "index_of_day"
  end

  create_table "tasks", :force => true do |t|
    t.string   "name"
    t.boolean  "is_done"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.datetime "done_at"
    t.integer  "direction_id"
    t.integer  "user_id"
    t.string   "desc"
  end

  add_index "tasks", ["created_at"], :name => "index_tasks_on_created_at"
  add_index "tasks", ["direction_id"], :name => "index_tasks_on_direction_id"
  add_index "tasks", ["id"], :name => "index_tasks_on_id", :unique => true
  add_index "tasks", ["is_done"], :name => "index_tasks_on_isDone"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.datetime "last_update_schedule"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
