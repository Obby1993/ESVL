class CreateNextGame < ActiveRecord::Migration[7.0]
  def change
    create_table :next_games do |t|
      t.date :date
      t.time :heure
      t.string :lieu
      t.string :team_a
      t.string :team_b
      t.string :division
      t.references :esvl_team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
