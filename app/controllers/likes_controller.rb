class LikesController < ApplicationController
  before_action :require_login

  def create
    tweet = Tweet.find(params[:twwet_id])

    unless tweet.liked?(current_user)
        tweet.like(current_user)
    end

    redirect_to root_path
  end

  def destroy
    like = current_user.likes.find(params[:id])
    tweet = like.tweet
    
    tweet.unlike(current_user)

    redirect_to root_path
  end
end