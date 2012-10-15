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

ActiveRecord::Schema.define(:version => 20120902203424) do

  create_table "mibs", :force => true do |t|
    t.string "oid"
    t.string "name"
    t.string "module"
  end

  add_index "mibs", ["name", "module"], :name => "index_mibs_on_name_and_module"
  add_index "mibs", ["oid"], :name => "index_mibs_on_oid", :unique => true

  create_table "servers", :force => true do |t|
    t.string   "title"
    t.string   "hostname"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "watch_data", :force => true do |t|
    t.integer  "watch_id"
    t.string   "raw_data"
    t.string   "value"
    t.datetime "time"
  end

  add_index "watch_data", ["watch_id", "time"], :name => "index_watch_data_on_watch_id_and_time", :unique => true
  add_index "watch_data", ["watch_id"], :name => "index_watch_data_on_watch_id"

  create_table "watches", :force => true do |t|
    t.integer  "server_id"
    t.string   "oid"
    t.string   "title"
    t.string   "units"
    t.integer  "interval"
    t.boolean  "enabled"
    t.boolean  "differential"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.float    "multiplier",   :default => 1.0, :null => false
    t.integer  "accuracy",     :default => 0,   :null => false
  end

  add_index "watches", ["server_id"], :name => "index_watches_on_server_id"

end
