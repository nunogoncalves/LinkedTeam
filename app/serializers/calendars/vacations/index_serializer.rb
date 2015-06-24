module Calendars
  module Vacations
    class IndexSerializer < ActiveModel::Serializer
      attributes :date, :user_name

      def user_name
        object.calendars_user.name
      end
    end
  end
end