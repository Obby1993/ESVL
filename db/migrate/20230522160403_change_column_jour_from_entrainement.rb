class ChangeColumnJourFromEntrainement < ActiveRecord::Migration[7.0]
  def change
    remove_column :entrainements, :jour
    add_column :entrainements, :jour, :string
  end
end
