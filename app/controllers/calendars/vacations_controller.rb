module Calendars
  class VacationsController < ApplicationController

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
    end
  end
end