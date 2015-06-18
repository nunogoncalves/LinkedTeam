class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def home
    @year = params[:year].try(:to_i) || DateTime.new(DateTime.now.year, 1, 1).year
    if params[:year].blank? || params[:month].blank?
      @date = DateTime.now
    else
      @date = DateTime.new(params[:year].to_i, params[:month].to_i, 1) rescue DateTime.now
    end
    @show_year = params[:show_year] || false
  end

end
