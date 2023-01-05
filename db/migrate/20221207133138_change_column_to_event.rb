class ChangeColumnToEvent < ActiveRecord::Migration[7.0]
  def change
    remove_column :event_teams, :paye
    add_reference :commandes, :event_team, foreign_key: true
  end
end
