module Calendars
  module Vacations
    class Index

      include WFlow::Process

      data_reader :params
      data_writer :vacations

      def perform
        self.vacations = vacations.map do |vacation|
          IndexSerializer.new(vacation).serializable_hash
        end
      end

      def vacations
        if params[:q].present?
          q = Vacation.search(params[:q])
          q.result(distinct: true)
        else
          Vacation.all
        end
      end


    end
  end
end
