class RenameEventsToEventOnEventTeamModel < ActiveRecord::Migration[7.0]
  def change
    rename_column :event_teams, :events_id, :event_id
  end
end
