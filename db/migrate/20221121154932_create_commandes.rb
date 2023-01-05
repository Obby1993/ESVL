class CreateCommandes < ActiveRecord::Migration[7.0]
  def change
    create_table :commandes do |t|
      t.string :email
      t.string :nom
      t.references :article, null: false, foreign_key: true
      t.integer :quantité
      t.string :taille

      t.timestamps
    end
  end
end
