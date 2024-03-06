class ChangeColoneFromNextGame < ActiveRecord::Migration[7.0]
  def change
    remove_column :next_games, :day
    remove_column :next_games, :date
    add_column :next_games, :day, :Date
  end
end
