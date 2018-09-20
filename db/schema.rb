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

ActiveRecord::Schema.define(version: 20180913015623) do

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.string "homeground"
  end

  create_table "games", force: :cascade do |t|
    t.string "hometeam"
    t.string "awayteam"
    t.string "toss"
    t.string "result"

    #build a realationship between team models
  end

  create_table "scores",
  t.integer "game_id"
  t.integer "player_id"
  t.integer "runs"
end

  create_table "players", force: :cascade do |t|
    t.string  "name"
    t.integer "team_id"

  end

  # create_table "teams", force: :cascade do |t|
  #   t.string  "name"
  #   t.integer "club_id"
  # end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email_address"
    t.string "username"
    t.string "password_digest"
  end

end
