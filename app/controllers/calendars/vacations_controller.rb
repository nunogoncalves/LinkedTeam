module Calendars
  class VacationsController < ApplicationController
    def dashboard
      report = Calendars::Vacations::Api::Dashboard.run(user: current_user)

      if report.success?
        @teams = report.data.teams
      else

      end
    end
  end
end