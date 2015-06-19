module Calendars
  class VacationsController < ApplicationController
    def dashboard
      report = Calendars::Vacations::Api::Dashboard.run(user: current_user)

      if report.success?

      else

      end
    end
  end
end