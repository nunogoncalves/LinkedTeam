module Calendars
  module Admin
    module Teams
      module Api
        class New
          include WFlow::Process

          data_writer :team

          def perform
            self.team = Team.new
          end
        end
      end
    end
  end
end