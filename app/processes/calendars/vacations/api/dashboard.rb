module Calendars
  module Vacations
    module Api
      class Dashboard
        include WFlow::Process

        execute Teams::FindManagedByUser
      end
    end
  end
end