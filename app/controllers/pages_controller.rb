class PagesController < ApplicationController

  def home
    #  redirect to articles page if users logged in
    redirect_to articles_path if logged_in?
  end
  
  def about
    
  end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
