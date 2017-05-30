class CreateDivisions < ActiveRecord::Migration[5.1]
  def change
    create_table :divisions do |t|
      t.string  :name, unique: true, index: true
      t.integer :league_id 

      t.timestamps
    end
    add_foreign_key :divisions, :leagues, on_delete: :cascade
  end
end
