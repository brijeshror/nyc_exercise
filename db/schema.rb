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

ActiveRecord::Schema.define(version: 20170503055026) do

  create_table "buildings", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "energy_usages", force: :cascade do |t|
    t.integer "building_id"
    t.integer "measurement_id"
    t.integer "year"
    t.float "jan"
    t.float "feb"
    t.float "mar"
    t.float "apr"
    t.float "may"
    t.float "jun"
    t.float "jul"
    t.float "aug"
    t.float "sep"
    t.float "oct"
    t.float "nov"
    t.float "dec"
    t.float "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_energy_usages_on_building_id"
    t.index ["measurement_id"], name: "index_energy_usages_on_measurement_id"
    t.index ["year"], name: "index_energy_usages_on_year"
  end

  create_table "measurements", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
