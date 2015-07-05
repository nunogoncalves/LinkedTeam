class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def home
    @home_presenter = HomePresenter.new(current_calendars_user, params)
  end

  def authenticate_admin!
    raise 'not an admin' unless current_user.is_admin?
  end

  def current_calendars_user
    @current_calendars_user ||= Calendars::User.find_by_user_id(current_user.id)
  end

end
