class CreateEmployes < ActiveRecord::Migration[7.0]
  def change
    create_table :employes do |t|
      t.string :poste
      t.string :nom
      t.string :prenom
      t.integer :année

      t.timestamps
    end
  end
end
