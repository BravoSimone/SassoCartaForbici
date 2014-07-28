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

ActiveRecord::Schema.define(version: 20140728094554) do

  create_table "matches", force: true do |t|
    t.integer  "player_1_id"
    t.integer  "player_2_id"
    t.integer  "p1_win"
    t.integer  "p2_win"
    t.integer  "request_close"
    t.integer  "accept_close"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plays", force: true do |t|
    t.string   "player_one_sign"
    t.string   "player_two_sign"
    t.integer  "players_match_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "signs", force: true do |t|
    t.string   "player_one_sign"
    t.string   "player_two_sign"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "players_match_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
