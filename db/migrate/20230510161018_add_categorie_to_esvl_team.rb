class AddCategorieToEsvlTeam < ActiveRecord::Migration[7.0]
  def change
    add_column :esvl_teams, :categorie, :string
  end
end
