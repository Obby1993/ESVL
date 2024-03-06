class AddDateToNextGames < ActiveRecord::Migration[7.0]
  def change
    add_column :next_games, :date, :string
  end
end
