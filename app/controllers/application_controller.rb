class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def home
  end

  def current_user
    current_user = User.find_by_id(session[:user_id])
  end
end
