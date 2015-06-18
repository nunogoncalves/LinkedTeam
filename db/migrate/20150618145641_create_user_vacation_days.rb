class CreateUserVacationDays < ActiveRecord::Migration
  def change
    create_table :user_vacation_days do |t|
      t.integer :user_id
      t.integer :year
      t.integer :days
      t.integer :accepted_days
      t.integer :requested_days

      t.timestamps null: false
    end
  end
end
