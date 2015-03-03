class ApplicationController < ActionController::Base

  before_filter :set_cache_buster
  protect_from_forgery with: :exception
  helper_method :current_user

  private

  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    unless session[:user_id]
     flash[:error] = "You must be logged in to access!"
       redirect_to root_path # halts request cycle
     end
   end

  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
  end
end
