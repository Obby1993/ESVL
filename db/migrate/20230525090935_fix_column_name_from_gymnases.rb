class FixColumnNameFromGymnases < ActiveRecord::Migration[7.0]
  def change
    rename_column :gymnases, :adresse, :address
  end

end
