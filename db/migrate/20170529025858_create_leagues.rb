class CreateLeagues < ActiveRecord::Migration[5.1]
  def change
    create_table :leagues do |t|
      t.string  :name, unique: true, index: true
      t.integer :season_id

      t.timestamps
    end
    add_foreign_key :leagues, :seasons, on_delete: :cascade
  end
end
