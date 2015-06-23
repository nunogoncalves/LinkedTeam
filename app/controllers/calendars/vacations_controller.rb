module Calendars
  class VacationsController < ApplicationController

    def index
      vacations = Calendars::Vacations::Index.run(params: params).data.vacations
      render json: { vacations: vacations }
    end

    def create
      Calendars::Vacations::BulkCreate.run(
        {
          vacations: params[:vacations],
          calendars_user_id: current_calendars_user.id
          }
        )
      render json: {}
    end

  end
end