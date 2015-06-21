module Calendars
  module Admin
    class TeamsController < ApplicationController

      def index
        report = Teams::Api::Index.run

        @teams = report.data.teams
      end

      def new
        report = Teams::Api::New.run

        @team  = report.data.team
        @users = report.data.users
      end

      def create
        binding.pry
      end

      def destroy
      end

    end
  end
end