module Calendars
  module Vacations
    class BulkCreate
      include WFlow::Process

      data_reader :vacations, :calendars_user_id

      def perform
        vacations.each do |basic_vacation|
          v = build_vacation(basic_vacation)
          v.save
        end
      end

      def build_vacation(date_str)
        date = Date.strptime(date_str, '%Y-%m-%d')
        v = Vacation.new
        v.date = date
        v.year = date.year
        v.month = date.month
        v.day = date.day
        v.state = 'to_review'
        v.calendars_user_id = calendars_user_id
        v
      end
    end
  end
end
