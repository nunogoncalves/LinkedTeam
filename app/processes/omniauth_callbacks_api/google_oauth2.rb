module OmniauthCallbacksApi
  class GoogleOauth2
    include WFlow::Process

    execute Users::FindOrCreateFromOmniauth
  end
end