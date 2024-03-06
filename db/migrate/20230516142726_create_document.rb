class CreateDocument < ActiveRecord::Migration[7.0]
  def change
    create_table :documents do |t|
      t.string :titre
      t.integer :année

      t.timestamps
    end
  end
end
