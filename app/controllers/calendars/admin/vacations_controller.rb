module Calendars
  module Admin
    class VacationsController < ApplicationController

      def index
        report = Vacations::Api::Index.run(user: current_user)

        if report.success?
          @teams = report.data.teams
        else

        end
      end

    end
  end
end