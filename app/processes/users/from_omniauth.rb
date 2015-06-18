module Users
  class FromOmniauth
    include WFlow::Process

    data_reader :omniauth
    data_writer :user

    def setup
      flow.failure! if omniauth.nil?
    end

    def perform
      self.user = User.where(provider: omniauth.provider, uid: omniauth.uid).first_or_create do |u|
        u.provider = omniauth.provider
        u.uid      = omniauth.uid
        u.email    = omniauth.info.email
        u.password = Devise.friendly_token[0,20]
      end
    end
  end
end