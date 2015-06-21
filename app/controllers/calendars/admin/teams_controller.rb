module Calendars
  module Admin
    class TeamsController < ApplicationController

      def index
        report = Teams::Api::Index.run

        @teams = report.data.teams
      end

      def create
      end

      def destroy
      end

    end
  end
end