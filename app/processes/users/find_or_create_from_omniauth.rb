module Users
  class FindOrCreateFromOmniauth

    include WFlow::Process

    data_reader :omniauth
    data_writer :user

    def perform
      self.user = find || create
    end

  protected

    def find
      User.where(provider: omniauth.provider, uid: omniauth.uid).first
    end

    def create
      User.create do |u|
        u.provider         = omniauth.provider
        u.uid              = omniauth.uid
        u.first_name       = omniauth.info.first_name
        u.last_name        = omniauth.info.last_name
        u.email            = omniauth.info.email
        u.password         = Devise.friendly_token[0,20]
      end.tap do |u|
        Calendars::Users::CreateFromUser.run(user: u)
      end
    end

  end
end