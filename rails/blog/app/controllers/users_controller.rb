class UsersController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: "User was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def follow
    @user = User.find(params[:id])
    current_user.following << @user
    redirect_back(fallback_location: root_path, notice: "You are now following #{@user.username}")
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.following.delete(@user)
    redirect_back(fallback_location: root_path, notice: "You have unfollowed #{@user.username}")
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
