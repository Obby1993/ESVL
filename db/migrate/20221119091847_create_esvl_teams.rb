class CreateEsvlTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :esvl_teams do |t|
      t.integer :année
      t.string :division
      t.string :genre
      t.string :coach
      t.string :résultat
      t.string :joueurs
      t.string :autre

      t.timestamps
    end
  end
end
