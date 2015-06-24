class CreateCalendarsVacations < ActiveRecord::Migration
  def change
    create_table :calendars_vacations do |t|
      t.integer :calendars_user_id
      t.string :state
      t.integer :year
      t.integer :month
      t.integer :day
      t.date :date

      t.timestamps null: false
    end
  end
end
