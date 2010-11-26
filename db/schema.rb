# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 4) do

  create_table "articles", :force => true do |t|
    t.string   "society"
    t.string   "title"
    t.datetime "date"
    t.text     "description"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "societies", :force => true do |t|
    t.string   "society"
    t.text     "base"
    t.string   "email"
    t.string   "tel"
    t.string   "opening_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "president"
  end

  create_table "users", :force => true do |t|
    t.string   "society"
    t.string   "name"
    t.string   "surname"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end