class Calendars::User < ActiveRecord::Base

  table_name = :users

  belongs_to :user, class: ::User

  has_many :calendars_vacations,
           class:       Calendars::Vacation,
           foreign_key: :calendars_user_id

  has_many :calendars_annual_leaves,
           class:       Calendars::AnnualLeave,
           foreign_key: :calendars_user_id

  def total_leave_days
    calendars_annual_leaves.map(&:number_of_days).reduce(:+)
  end

  def remaining_leave_days
    total_leave_days - calendars_vacations.count
  end

end