class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # needed for knowing when user is logged in
  include SessionsHelper

  def authorized?
  	redirect_to root_path unless current_user
  end

end
