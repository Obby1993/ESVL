class AddColumnToEmploye < ActiveRecord::Migration[7.0]
  def change
    add_column :employes, :niveau_employe, :string
  end
end
