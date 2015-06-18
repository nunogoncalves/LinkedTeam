module Users
  class FromOmniauth
    include WFlow::Process

    data_reader :omniauth_auth
    data_writer :user

    def setup
      flow.failure! if omniauth_auth.nil?
    end

    def perform
      self.user = where(provider: auth.provider, uid: auth.uid).first_or_create do |u|
        u.provider = auth.provider
        u.uid      = auth.uid
        u.email    = auth.info.email
        u.password = Devise.friendly_token[0,20]
      end
    end
  end
end