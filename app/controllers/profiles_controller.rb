class ProfilesController < ApplicationController
  before_action :require_login

  def edit
    @profile = current_user.profile || current_user.build_profile
  end

  def update
    @profile = current_user.profile || current_user.build_profile

    if @profile.update(profile_params)
      redirect_to root_path, notice: "プロフィールを保存しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    current_user.profile&.destroy!
    redirect_to root_path, notice: "プロフィールを削除しました"
  end

  private

  def profile_params
    params.require(:profile).permit(:message)
  end
end