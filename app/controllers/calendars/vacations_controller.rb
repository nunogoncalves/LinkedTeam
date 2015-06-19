module Calendars
  class VacationsController < ApplicationController

    def index
      if params[:q].present?
        q = Vacation.search(params[:q])
        vacations = q.result(distinct: true)
      else
        vacations = Vacation.all
      end
      vacations = vacations.map do |vacation|
        ::Vacations::IndexSerializer.new(vacation).serializable_hash
      end

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
    end
  end
end