class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  #  lets rails know they're helper methods and will be able to use inside views
  helper_method :current_user, :logged_in?
  
  def current_user
    # return the current user if we already have the user and hit the database
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    # if we have a current_user or not
    !!current_user
  end
  
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged into perform that action"
      redirect_to root_path
    end
  end
end
