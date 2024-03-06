class CreateEntrainements < ActiveRecord::Migration[7.0]
  def change
    create_table :entrainements do |t|
      t.references :esvl_team, foreign_key: true
      t.datetime :horaire_debut
      t.datetime :horaire_fin
      t.datetime :jour
      t.references :gymnase, foreign_key: true

      t.timestamps
    end
  end
end
