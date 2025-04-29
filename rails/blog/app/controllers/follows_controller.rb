class FollowsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    current_user.following << @user
    redirect_back(fallback_location: root_path, notice: "You are now following #{@user.username}")
  end

  def destroy
    @user = User.find(params[:user_id])
    current_user.following.delete(@user)
    redirect_back(fallback_location: root_path, notice: "You have unfollowed #{@user.username}")
  end
end
