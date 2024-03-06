class CreateGymnases < ActiveRecord::Migration[7.0]
  def change
    create_table :gymnases do |t|
      t.string :nom
      t.string :adresse

      t.timestamps
    end
  end
end
