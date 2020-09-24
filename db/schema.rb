# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_24_223419) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beaches", force: :cascade do |t|
    t.string "name"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "buoy_beaches", force: :cascade do |t|
    t.bigint "beach_id", null: false
    t.bigint "buoy_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["beach_id"], name: "index_buoy_beaches_on_beach_id"
    t.index ["buoy_id"], name: "index_buoy_beaches_on_buoy_id"
  end

  create_table "buoys", force: :cascade do |t|
    t.string "station_code"
    t.string "station_name"
    t.string "station_owner"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "pgm"
    t.string "type"
    t.float "elev"
    t.string "met"
    t.string "hull"
    t.float "anemom_height"
  end

  create_table "entries", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "beach_id", null: false
    t.integer "session_duration"
    t.text "entry"
    t.string "wave_quality"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "session_start_time"
    t.index ["beach_id"], name: "index_entries_on_beach_id"
    t.index ["user_id"], name: "index_entries_on_user_id"
  end

  create_table "favorite_beaches", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "beach_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["beach_id"], name: "index_favorite_beaches_on_beach_id"
    t.index ["user_id"], name: "index_favorite_beaches_on_user_id"
  end

  create_table "meteorological_data", force: :cascade do |t|
    t.bigint "buoy_id", null: false
    t.integer "wind_dir"
    t.float "wind_speed"
    t.float "wind_gust"
    t.float "wave_height"
    t.integer "dom_wave_period"
    t.float "avg_wave_period"
    t.integer "wave_dir"
    t.float "sea_pressure"
    t.float "air_temp"
    t.float "sea_temp"
    t.string "tide"
    t.datetime "recorded_data_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["buoy_id"], name: "index_meteorological_data_on_buoy_id"
  end

  create_table "spectral_wave_data", force: :cascade do |t|
    t.bigint "buoy_id", null: false
    t.string "swell_dir"
    t.string "swell_height"
    t.string "swell_period"
    t.string "wind_wave_dir"
    t.string "wind_wav_height"
    t.string "overall_height_and_period"
    t.string "steepness"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["buoy_id"], name: "index_spectral_wave_data_on_buoy_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "buoy_beaches", "beaches"
  add_foreign_key "buoy_beaches", "buoys"
  add_foreign_key "entries", "beaches"
  add_foreign_key "entries", "users"
  add_foreign_key "favorite_beaches", "beaches"
  add_foreign_key "favorite_beaches", "users"
  add_foreign_key "meteorological_data", "buoys"
  add_foreign_key "spectral_wave_data", "buoys"
end
