class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #--- FOUND THE BUG: this was interfering with Devise current_user method...
  #def current_user
  #  return User.first
  #end

  # --- DONT NEED THIS ONE EITHER ... it was for Blogit
  #def login_required
  #  return false
  #end

end
