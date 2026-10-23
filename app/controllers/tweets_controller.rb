class TweetsController < ApplicationController
  before_action :require_login

  def create
    tweet = current_user.tweets.build(tweet_params)

    if tweet.save
      redirect_to root_path, notice: "投稿しました"
    else
      redirect_to root_path, alert: "メッセージを入力してください"
    end
  end

  def destroy
    tweet = current_user.tweets.find(params[:id])
    tweet.destroy

    redirect_to root_path, notice: "削除しました", status: :see_other
  end

  private

  def tweet_params
    params.require(:tweet).permit(:message)
  end
end