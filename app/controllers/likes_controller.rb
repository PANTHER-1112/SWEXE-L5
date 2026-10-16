class LikesController < ApplicationController
  before_action :require_login

  def create
    current_user.likes.find_or_create_by(tweet_id: params[:tweet_id])
    redirect_to root_path
  end

  def destroy
    like = current_user.likes.find(params[:id])
    like.destroy

    redirect_to root_path
  end
end