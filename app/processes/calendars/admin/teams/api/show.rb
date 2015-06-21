module Calendars
  module Admin
    module Teams
      module Api
        class Show
          include WFlow::Process

          data_reader :team_id
          data_writer :team

          def perform
            self.team = Team.find(team_id)
          end
        end
      end
    end
  end
end