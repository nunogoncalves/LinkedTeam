class CreateCalendarsAnnualLeaves < ActiveRecord::Migration
  def change
    create_table :calendars_annual_leaves do |t|
      t.integer :calendars_user_id

      t.timestamps null: false
    end
  end
end
