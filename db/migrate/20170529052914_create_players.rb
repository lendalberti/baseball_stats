class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :at_bats, index: true
      t.string :avg, index: true    # calculate
      t.string :balk, index: true
      t.string :caught_stealing, index: true
      t.string :complete_games, index: true
      t.string :doubles, index: true
      t.string :earned_runs, index: true
      t.string :era, index: true
      t.string :ERRORS, index: true    #  don't lowercase 'ERRORS' because 'errors' is already defined in Active Record
      t.string :games, index: true
      t.string :games_started, index: true
      t.string :given_name, index: true
      t.string :hits, index: true
      t.string :hit_batter, index: true
      t.string :hit_by_pitch, index: true
      t.string :home_runs, index: true
      t.string :innings, index: true
      t.string :losses, index: true
      t.string :ops, index: true    # calculate
      t.string :pb, index: true
      t.string :position, index: true
      t.string :rbi, index: true
      t.string :runs, index: true
      t.string :sacrifice_flies, index: true
      t.string :sacrifice_hits, index: true
      t.string :saves, index: true
      t.string :shut_outs, index: true
      t.string :steals, index: true
      t.string :struck_out, index: true
      t.string :struck_out_batter, index: true
      t.string :surname, index: true
      t.integer :team_id
      t.string :throws, index: true
      t.string :triples, index: true
      t.string :walked_batter, index: true
      t.string :walks, index: true
      t.string :wild_pitches, index: true
      t.string :wins, index: true

      t.timestamps
    end
    add_foreign_key :players, :teams, on_delete: :cascade
  end
end
