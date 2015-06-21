module Calendars
  module Admin
    class TeamsController < ApplicationController

      def index
        report = Teams::Api::Index.run

        @teams = report.data.teams
      end

      def new
        report = Teams::Api::New.run

        @team = report.data.team
      end

      def create
        report = Teams::Api::Create.run(team_attributes: params[:team])

        @team = report.data.team

        if report.success?
          redirect_to calendars_admin_team_path(@team)
        else
          render :new
        end
      end

      def show
      end

      def destroy
      end

    end
  end
end