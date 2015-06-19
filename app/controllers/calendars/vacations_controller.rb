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
          user_id: current_user.id
          }
        )
      render json: {}
    end

    def dashboard
      report = Vacations::Api::Dashboard.run(user: current_user)

      if report.success?
        binding.pry

        @teams_hash = ActiveModel::ArraySerializer.new(report.data.teams, each_serializer: Teams::WithElementsSerializer).as_json
      else

      end
    end

  end
end