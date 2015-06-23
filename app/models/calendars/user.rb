class Calendars::User < ActiveRecord::Base

  belongs_to :user

  has_many :calendars_annual_leaves,
           class:       Calendars::AnnualLeave,
           foreign_key: :calendars_user_id

end
