class TopController < ApplicationController
  def main
    @tweets = Tweet.includes(:user).order(created_at: :desc)
    @tweet = Tweet.new
  end

  def login
    user = User.find_by(uid: params[:uid])

    if user&.authenticate(params[:password])
      session[:login_uid] = user.uid
      redirect_to root_path, notice: "ログインしました"
    else
      redirect_to root_path, alert: "ログインに失敗しました"
    end
  end

  def logout
    reset_session
    redirect_to root_path, notice: "ログアウトしました"
  end
end