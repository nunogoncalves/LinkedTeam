class CreateVacations < ActiveRecord::Migration
  def change
    create_table :vacations do |t|
      t.integer :user_id
      t.date :date
      t.integer :year
      t.integer :monht
      t.integer :day
      t.integer :day_of_the_week
      t.string :state

      t.timestamps null: false
    end
  end
end
