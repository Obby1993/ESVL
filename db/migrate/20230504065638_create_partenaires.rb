class CreatePartenaires < ActiveRecord::Migration[7.0]
  def change
    create_table :partenaires do |t|
      t.date :année
      t.string :entreprise
      t.string :contact
      t.integer :numero
      t.string :email

      t.timestamps
    end
  end
end
