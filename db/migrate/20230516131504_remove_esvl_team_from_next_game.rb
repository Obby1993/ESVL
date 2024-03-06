class RemoveEsvlTeamFromNextGame < ActiveRecord::Migration[7.0]
  def change
    remove_column :next_games, :esvl_team_id, :references
  end
end
