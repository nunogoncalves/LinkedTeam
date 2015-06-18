class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    report = OmniauthCallbacksApi::GoogleOauth2.run(omniauth: request.env["omniauth.auth"])

    if report.success?
      sign_in_and_redirect report.data.user
    else
      flash[:sign_in_failure] = 'invalid_hosted_domain'

      redirect_to new_user_session_path
    end
  end
end