class Calendars::Vacation < ActiveRecord::Base

  STATES = %w(accepted rejected to_review)

  belongs_to :calendars_user, class: Calendars::User

end
