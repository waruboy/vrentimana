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

ActiveRecord::Schema.define(version: 20140604232611) do

  create_table "corridors", force: true do |t|
    t.integer  "number"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "corridors", ["number"], name: "index_corridors_on_number"

  create_table "queries", force: true do |t|
    t.string   "text"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tj_stops", force: true do |t|
    t.string   "name"
    t.string   "google_lookup"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "corridor_id"
  end

  add_index "tj_stops", ["corridor_id"], name: "index_tj_stops_on_corridor_id"
  add_index "tj_stops", ["latitude"], name: "index_tj_stops_on_latitude"
  add_index "tj_stops", ["longitude"], name: "index_tj_stops_on_longitude"

end
