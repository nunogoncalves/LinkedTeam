class CreateTeamElements < ActiveRecord::Migration
  def change
    create_table :team_elements do |t|
      t.integer :user_id
      t.integer :team_id
      t.boolean :responsible, default: false

      t.timestamps null: false
    end
  end
end
