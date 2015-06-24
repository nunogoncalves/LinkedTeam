module Calendars
  module Users
    class CreateFromUser

      include WFlow::Process

      data_reader :user
      data_writer :calendars_user

      def perform
        self.calendars_user = Calendars::User.create(user: user)
      end

    end
  end
end