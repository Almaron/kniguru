class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def current_season
      @current_season ||= Season.where("start_on <= ?", Date.today).order(:start_on => :desc).first
  end
  
  helper_method :current_season
  
end
