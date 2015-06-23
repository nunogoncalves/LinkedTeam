class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def home
    @home_presenter = HomePresenter.new(params)
  end

end
