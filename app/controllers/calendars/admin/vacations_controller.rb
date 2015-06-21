module Calendars
  module Admin
    class VacationsController < ApplicationController

      def index
        report = Vacations::Api::Index.run(user: current_user)

        if report.success?
          @teams_hash = ActiveModel::ArraySerializer.new(report.data.teams, each_serializer: Teams::WithMembersSerializer).as_json
        else

        end
      end

    end
  end
end