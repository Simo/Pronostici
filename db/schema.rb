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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110423095415) do

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bets", :force => true do |t|
    t.integer  "game_id"
    t.integer  "round_id"
    t.integer  "champion_id"
    t.string   "bid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bets", ["champion_id"], :name => "index_bets_on_champion_id"
  add_index "bets", ["game_id"], :name => "index_bets_on_game_id"
  add_index "bets", ["round_id"], :name => "index_bets_on_round_id"

  create_table "champions", :force => true do |t|
    t.string   "nome_campionato"
    t.integer  "priority"
    t.string   "ambito"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", :force => true do |t|
    t.integer  "round_id"
    t.integer  "home_team_id"
    t.integer  "away_team_id"
    t.integer  "codfip"
    t.string   "result"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "legs", :force => true do |t|
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rounds", :force => true do |t|
    t.integer  "champion_id"
    t.string   "nome_turno"
    t.string   "nome_breve"
    t.integer  "leg_id"
    t.date     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", :force => true do |t|
    t.string   "nome"
    t.string   "sponsor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
