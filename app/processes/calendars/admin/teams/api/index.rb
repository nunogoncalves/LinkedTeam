module Calendars
  module Admin
    module Teams
      module Api
        class Index

          include WFlow::Process

          data_writer :teams

          def perform
            self.teams = Team.all
          end

        end
      end
    end
  end
end