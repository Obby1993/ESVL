class AddCoordinatesToGymnases < ActiveRecord::Migration[7.0]
  def change
    add_column :gymnases, :latitude, :float
    add_column :gymnases, :longitude, :float
  end
end
