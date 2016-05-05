class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def require_signin
    unless current_user
      session[:last_requested_url] = request.url
      redirect_to root_path, notice: "Please create or sign into your account first."
    end
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def current_user?(user)
    current_user == user
  end

  helper_method :current_user?

  def admin?
    current_user.user_type == 'admin'
  end

  helper_method :admin?

  def require_admin
    unless current_user_admin?
      redirect_to root_path, notice: "You are not authorized to do that."
    end
  end

  def current_user_admin?
    current_user && current_user.user_type == 'admin'
  end

  helper_method :current_user_admin?
end
