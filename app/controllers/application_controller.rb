class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def home
    @home_presenter = HomePresenter.new(params)
  end

  def authenticate_admin!
    raise 'not an admin' unless current_user.is_admin?
  end

end
