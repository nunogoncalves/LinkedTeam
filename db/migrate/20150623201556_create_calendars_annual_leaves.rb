class CreateCalendarsAnnualLeaves < ActiveRecord::Migration
  def change
    create_table :calendars_annual_leaves do |t|
      t.integer :calendars_user_id
      t.integer :year
      t.integer :number_of_days

      t.timestamps null: false
    end
  end
end
