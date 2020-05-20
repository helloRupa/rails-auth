class ApplicationController < ActionController::Base
  def login(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def not_logged_in
    redirect_to login_path unless logged_in?
  end

  def logged_in
    redirect_to user_path(current_user) if logged_in?
  end
end
