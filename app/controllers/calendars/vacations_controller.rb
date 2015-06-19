module Calendars
  class VacationsController < ApplicationController
    def dashboard
      report = Calendars::Vacations::Api::Dashboard.run(user: current_user)
    end
  end
end