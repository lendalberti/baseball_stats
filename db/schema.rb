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

ActiveRecord::Schema.define(version: 20170529052914) do

  create_table "divisions", force: :cascade do |t|
    t.string "name"
    t.integer "league_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_divisions_on_name"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.integer "season_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_leagues_on_name"
  end

  create_table "players", force: :cascade do |t|
    t.string "at_bats"
    t.string "avg"
    t.string "balk"
    t.string "caught_stealing"
    t.string "complete_games"
    t.string "doubles"
    t.string "earned_runs"
    t.string "era"
    t.string "ERRORS"
    t.string "games"
    t.string "games_started"
    t.string "given_name"
    t.string "hits"
    t.string "hit_batter"
    t.string "hit_by_pitch"
    t.string "home_runs"
    t.string "innings"
    t.string "losses"
    t.string "ops"
    t.string "pb"
    t.string "position"
    t.string "rbi"
    t.string "runs"
    t.string "sacrifice_flies"
    t.string "sacrifice_hits"
    t.string "saves"
    t.string "shut_outs"
    t.string "steals"
    t.string "struck_out"
    t.string "struck_out_batter"
    t.string "surname"
    t.integer "team_id"
    t.string "throws"
    t.string "triples"
    t.string "walked_batter"
    t.string "walks"
    t.string "wild_pitches"
    t.string "wins"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ERRORS"], name: "index_players_on_ERRORS"
    t.index ["at_bats"], name: "index_players_on_at_bats"
    t.index ["avg"], name: "index_players_on_avg"
    t.index ["balk"], name: "index_players_on_balk"
    t.index ["caught_stealing"], name: "index_players_on_caught_stealing"
    t.index ["complete_games"], name: "index_players_on_complete_games"
    t.index ["doubles"], name: "index_players_on_doubles"
    t.index ["earned_runs"], name: "index_players_on_earned_runs"
    t.index ["era"], name: "index_players_on_era"
    t.index ["games"], name: "index_players_on_games"
    t.index ["games_started"], name: "index_players_on_games_started"
    t.index ["given_name"], name: "index_players_on_given_name"
    t.index ["hit_batter"], name: "index_players_on_hit_batter"
    t.index ["hit_by_pitch"], name: "index_players_on_hit_by_pitch"
    t.index ["hits"], name: "index_players_on_hits"
    t.index ["home_runs"], name: "index_players_on_home_runs"
    t.index ["innings"], name: "index_players_on_innings"
    t.index ["losses"], name: "index_players_on_losses"
    t.index ["ops"], name: "index_players_on_ops"
    t.index ["pb"], name: "index_players_on_pb"
    t.index ["position"], name: "index_players_on_position"
    t.index ["rbi"], name: "index_players_on_rbi"
    t.index ["runs"], name: "index_players_on_runs"
    t.index ["sacrifice_flies"], name: "index_players_on_sacrifice_flies"
    t.index ["sacrifice_hits"], name: "index_players_on_sacrifice_hits"
    t.index ["saves"], name: "index_players_on_saves"
    t.index ["shut_outs"], name: "index_players_on_shut_outs"
    t.index ["steals"], name: "index_players_on_steals"
    t.index ["struck_out"], name: "index_players_on_struck_out"
    t.index ["struck_out_batter"], name: "index_players_on_struck_out_batter"
    t.index ["surname"], name: "index_players_on_surname"
    t.index ["throws"], name: "index_players_on_throws"
    t.index ["triples"], name: "index_players_on_triples"
    t.index ["walked_batter"], name: "index_players_on_walked_batter"
    t.index ["walks"], name: "index_players_on_walks"
    t.index ["wild_pitches"], name: "index_players_on_wild_pitches"
    t.index ["wins"], name: "index_players_on_wins"
  end

  create_table "seasons", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_seasons_on_name"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "division_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_teams_on_name"
  end

end
