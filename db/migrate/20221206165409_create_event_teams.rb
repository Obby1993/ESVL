class CreateEventTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :event_teams do |t|
      t.references :events, null: false, foreign_key: true
      t.string :nom_equipe
      t.string :niveau
      t.string :nom_capitaine
      t.string :email_capitaine
      t.string :numero_capitaine
      t.integer :nb_joueur
      t.string :joueurs
      t.boolean :paye

      t.timestamps
    end
  end
end
