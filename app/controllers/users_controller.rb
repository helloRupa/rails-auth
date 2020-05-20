class UsersController < ApplicationController
  before_action :logged_in, only: [:new, :create]
  before_action :not_logged_in, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
