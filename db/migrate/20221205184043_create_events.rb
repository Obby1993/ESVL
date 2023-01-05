class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :nom
      t.integer :nb_equipes
      t.integer :prix_inscription
      t.date :date_event
      t.date :deadline_register
      t.string :genre
      t.string :autre
      t.integer :nb_joueur_equipe
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
