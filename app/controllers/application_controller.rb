class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def home
    @year = params[:year].try(:to_i) || DateTime.new(DateTime.now.year, 1, 1).year
  end

end
