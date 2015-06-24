class Calendars::User < ActiveRecord::Base

  table_name = :users

  belongs_to :user, class: ::User

  has_many :calendars_vacations,
           class:       Calendars::Vacation,
           foreign_key: :calendars_user_id

  has_many :calendars_annual_leaves,
           class:       Calendars::AnnualLeave,
           foreign_key: :calendars_user_id

  delegate :name, to: :user

end