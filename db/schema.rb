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

ActiveRecord::Schema.define(version: 2021_10_02_161537) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "days", force: :cascade do |t|
    t.boolean "populated", default: false
    t.boolean "cancelled", default: false
    t.bigint "request_id"
    t.bigint "week_id"
    t.text "start_time", default: ""
    t.text "end_time", default: ""
    t.integer "cp1", default: 1
    t.integer "cp2", default: 1
    t.decimal "mp1", default: "0.0"
    t.decimal "mp2", default: "0.0"
    t.boolean "MT1", default: false
    t.boolean "MT2", default: false
    t.boolean "MT3", default: false
    t.boolean "MT4", default: false
    t.boolean "other", default: false
    t.boolean "taw", default: false
    t.boolean "form_b", default: false
    t.boolean "form_c", default: false
    t.boolean "track_and_time", default: false
    t.boolean "inacc_track", default: false
    t.boolean "single_track", default: false
    t.string "briefing_time", default: ""
    t.string "briefing_location", default: ""
    t.string "briefing_name", default: ""
    t.string "briefing_number", default: ""
    t.string "worker_primary", default: "-"
    t.string "worker_secondary1", default: "-"
    t.string "worker_secondary2", default: "-"
    t.string "worker_secondary3", default: "-"
    t.string "worker_secondary4", default: "-"
    t.string "worker_secondary5", default: "-"
    t.text "requestor_notes", default: ""
    t.text "admin_notes", default: ""
    t.text "inspector_notes", default: ""
    t.string "approval_group_1", default: "pending"
    t.string "approval_group_2", default: "pending"
    t.string "approval_group_3", default: "pending"
    t.string "approval_group_4", default: "pending"
    t.index ["request_id"], name: "index_days_on_request_id"
    t.index ["week_id"], name: "index_days_on_week_id"
  end

  create_table "requests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.integer "year", null: false
    t.bigint "week_id"
    t.string "contractor"
    t.string "status", default: "pending"
    t.index ["user_id"], name: "index_requests_on_user_id"
    t.index ["week_id"], name: "index_requests_on_week_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "default_color", default: "color_ffffff", null: false
    t.string "name"
    t.string "phone"
    t.string "company"
    t.string "role", default: "user"
    t.integer "approval_group", default: 0
    t.boolean "active", default: true, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "weeks", force: :cascade do |t|
    t.integer "weeknum"
  end

end
