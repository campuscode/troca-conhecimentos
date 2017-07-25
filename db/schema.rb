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

ActiveRecord::Schema.define(version: 20170725223459) do

  create_table "ads", force: :cascade do |t|
    t.string "requested_knowledge"
    t.string "offered_knowledge"
    t.string "meeting_type"
    t.string "day_period"
    t.string "location"
    t.string "avaliability"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.boolean "active"
    t.index ["user_id"], name: "index_ads_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.date "birth_date"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
    t.string "state"
    t.text "skills"
    t.string "photo"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.text "description"
    t.text "requested_knowledge"
    t.string "email"
    t.string "day_period"
    t.string "meeting_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "ad_id"
    t.integer "status"
    t.index ["ad_id"], name: "index_proposals_on_ad_id"
    t.index ["user_id"], name: "index_proposals_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
