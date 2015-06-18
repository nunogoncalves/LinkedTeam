module Users
  class FindOrCreateFromOmniauth
    include WFlow::Process

    data_reader :omniauth
    data_writer :user

    def setup
      flow.failure!('omniauth is nil') if omniauth.nil?
      flow.failure!('can only logon from linkedcare.com') if invalid_hd?
    end

    def perform
      self.user = User.where(provider: omniauth.provider, uid: omniauth.uid).first_or_create do |u|
        u.provider = omniauth.provider
        u.uid      = omniauth.uid
        u.email    = omniauth.info.email
        u.password = Devise.friendly_token[0,20]
      end
    end

  protected

    def invalid_hd?
      omniauth['extra']['raw_info']['hd'] != 'linkedcare.com'
    end
  end
end