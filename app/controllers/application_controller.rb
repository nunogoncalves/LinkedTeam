class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def home
    today = DateTime.now
    year = params[:year].try(:to_i) || today.year
    month = params[:month].try(:to_i) || today.month
    day = today.day

    @date = DateTime.new(year, month, day)

    @show_year = params[:show_year] || false
  end

end
