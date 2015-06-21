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
        report = Teams::Api::Show.run(team_id: params[:id])

        @team = report.data.team
      end

      def destroy
      end

      def edit
      end

      def update
      end

    end
  end
end