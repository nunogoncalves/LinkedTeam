module Calendars
  module Vacations
    module Api
      class Dashboard
        include WFlow::Process

        execute Load
      end
    end
  end
end