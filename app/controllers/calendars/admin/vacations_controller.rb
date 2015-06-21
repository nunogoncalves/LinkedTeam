module Calendars
  module Admin
    class VacationsController < ApplicationController

      def dashboard
        report = Vacations::Api::Dashboard.run(user: current_user)

        if report.success?
          @teams_hash = ActiveModel::ArraySerializer.new(report.data.teams, each_serializer: Teams::WithElementsSerializer).as_json
        else

        end
      end

    end
  end
end