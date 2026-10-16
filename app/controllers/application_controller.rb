class ApplicationController < ActionController::Base
  helper_method :current_user

  private

  def current_user
    return nil unless session[:login_uid]

    @current_user ||= User.find_by(uid: session[:login_uid])
  end

  def require_login
    return if current_user

    redirect_to root_path, alert: "ログインしてください"
  end
end