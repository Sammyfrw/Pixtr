class ApplicationController < ActionController::Base
  include Monban::ControllerHelpers
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login

  # def current_user
  #   if cookies[:user_id]
  #     User.find(cookies[:user_id])
  #   end
  # end

  # def signed_in?
  #   current_user
  # end
  # helper_method :current_user
  # helper_method :signed_in?

end
