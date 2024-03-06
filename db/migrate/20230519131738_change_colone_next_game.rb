class ChangeColoneNextGame < ActiveRecord::Migration[7.0]
  def change
    remove_column :next_games, :date
    add_column :next_games, :day, :string
  end
end
