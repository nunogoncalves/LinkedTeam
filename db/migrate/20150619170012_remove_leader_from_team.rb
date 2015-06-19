class RemoveLeaderFromTeam < ActiveRecord::Migration
  def change
    remove_column :teams, :learder_id
  end
end
