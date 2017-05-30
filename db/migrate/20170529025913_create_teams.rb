class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string  :name, unique: true, index: true
      t.integer :division_id    

      t.timestamps
    end
    add_foreign_key :teams, :divisions, on_delete: :cascade
  end
end
