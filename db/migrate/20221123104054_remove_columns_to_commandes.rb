class RemoveColumnsToCommandes < ActiveRecord::Migration[7.0]
  def change
    remove_column :commandes, :nom
    remove_column :commandes, :email
  end
end
