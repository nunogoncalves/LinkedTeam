class ChangeVacationsMonthColumnName < ActiveRecord::Migration
  def up
    rename_column :vacations, :monht, :month
  end

  def down
    rename_column :users, :month, :monht
  end
end
