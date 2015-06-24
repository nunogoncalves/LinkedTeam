module Users
  module Api
    class GoogleOauth2

      include WFlow::Process

      data_reader :omniauth

      def setup
        flow.failure!('omniauth object is nil') if omniauth.nil?
        flow.failure!('can only logon from linkedcare.com') if invalid_hosted_domain?
      end

      execute Users::FindOrCreateFromOmniauth

    protected

      def invalid_hosted_domain?
        omniauth.extra.raw_info.hd != 'linkedcare.com'
      end

    end
  end
end