class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :titre
      t.string :taille_disponible
      t.string :genre
      t.string :remarque
      t.string :categorie

      t.timestamps
    end
  end
end
