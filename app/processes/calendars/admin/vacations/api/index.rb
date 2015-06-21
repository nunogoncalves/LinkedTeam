module Calendars
  module Admin
    module Vacations
      module Api
        class Index
          include WFlow::Process

          execute Teams::FindManagedByUser
        end
      end
    end
  end
end