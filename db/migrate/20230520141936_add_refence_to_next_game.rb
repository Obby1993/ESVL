class AddRefenceToNextGame < ActiveRecord::Migration[7.0]
  def change
    add_reference :next_games, :esvl_team, foreign_key: true
  end
end
