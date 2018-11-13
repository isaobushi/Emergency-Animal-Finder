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

ActiveRecord::Schema.define(version: 2018_11_13_222042) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "found_animals", force: :cascade do |t|
    t.string "species"
    t.date "date_found"
    t.date "date_posted"
    t.string "location_found"
    t.string "location_current"
    t.text "image_url"
    t.string "health_status"
    t.bigint "incident_id"
    t.bigint "user_id"
    t.text "tags", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["incident_id"], name: "index_found_animals_on_incident_id"
    t.index ["user_id"], name: "index_found_animals_on_user_id"
  end

  create_table "incidents", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lost_animals", force: :cascade do |t|
    t.string "species"
    t.date "date_lost"
    t.string "location_lost"
    t.bigint "incident_id"
    t.bigint "user_id"
    t.text "tags", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["incident_id"], name: "index_lost_animals_on_incident_id"
    t.index ["user_id"], name: "index_lost_animals_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.text "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "found_animals", "incidents"
  add_foreign_key "found_animals", "users"
  add_foreign_key "lost_animals", "incidents"
  add_foreign_key "lost_animals", "users"
end