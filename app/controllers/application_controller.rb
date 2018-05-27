class ApplicationController < ActionController::Base
  before_action :ensure_logged_in
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def ensure_logged_in
    redirect_to :root unless logged_in?
  end
end
