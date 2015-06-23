class Calendars::AnnualLeave < ActiveRecord::Base

  belongs_to :calendars_user, class: Calendars::User

end