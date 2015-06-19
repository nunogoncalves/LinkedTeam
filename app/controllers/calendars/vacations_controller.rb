module Calendars
  class VacationsController < ApplicationController

    def index
      vacations = Calendars::Vacations::Index.run(params: params).data.vacations
      render json: vacations
    end

    def create
      Calendars::Vacations::BulkCreate.run(
        {
          vacations: params[:vacations],
          user_id: current_user.id
          }
        )
      render json: {}
    end

    def dashboard
      report = Calendars::Vacations::Api::Dashboard.run(user: current_user)

      if report.success?
        @teams = report.data.teams
      else

      end
    end
  end
end