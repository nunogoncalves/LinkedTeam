class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    report = OmniauthCallbacksApi::GoogleOauth2.run(omniauth: request.env["omniauth.auth"])

    if report.success?
      sign_in_and_redirect report.data.user
    else
    end
  end
end