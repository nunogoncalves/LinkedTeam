module Calendars
  class ApplicationController < ::ApplicationController

    def current_calendars_user
      @current_calendars_user ||= Calendars::User.find_by_user_id(current_user.id)
    end

  end
end