# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_06_29_205809) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artist_events", force: :cascade do |t|
    t.bigint "artist_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_artist_events_on_artist_id"
    t.index ["event_id"], name: "index_artist_events_on_event_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "logo"
    t.string "spotify_url"
    t.string "instagram_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "state"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sponsor_events", force: :cascade do |t|
    t.bigint "sponsor_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_sponsor_events_on_event_id"
    t.index ["sponsor_id"], name: "index_sponsor_events_on_sponsor_id"
  end

  create_table "sponsors", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vendor_events", force: :cascade do |t|
    t.bigint "vendor_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_vendor_events_on_event_id"
    t.index ["vendor_id"], name: "index_vendor_events_on_vendor_id"
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "artist_events", "artists"
  add_foreign_key "artist_events", "events"
  add_foreign_key "sponsor_events", "events"
  add_foreign_key "sponsor_events", "sponsors"
  add_foreign_key "vendor_events", "events"
  add_foreign_key "vendor_events", "vendors"
end
