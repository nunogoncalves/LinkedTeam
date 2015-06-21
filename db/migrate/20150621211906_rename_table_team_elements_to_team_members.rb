class RenameTableTeamElementsToTeamMembers < ActiveRecord::Migration
  def change
    rename_table :team_elements, :team_members
  end
end
