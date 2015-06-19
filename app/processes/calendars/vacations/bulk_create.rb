module Calendars
  module Vacations
    class BulkCreate
      include WFlow::Process

      data_reader :vacations, :user_id

      def perform
        vacations.each do |basic_vacation|
          v = build_vacation(basic_vacation)
          v.save
        end
      end

      def user
        User.find(user_id)
      end

      def build_vacation(date_str)
        date = Date.strptime(date_str, '%Y-%m-%d')
        v = Vacation.new
        v.date = date
        v.year = date.year
        v.month = date.month
        v.day = date.day
        v.day_of_the_week = date.wday
        v.state = 'to_review'
        v.user_id = user_id
        v
      end
    end
  end
end
