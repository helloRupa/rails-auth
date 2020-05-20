class SessionsController < ApplicationController
  before_action :logged_in, only: [:new, :create]
  before_action :not_logged_in, only: [:destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_username(params[:username])

    if @user && @user.authenticate(params[:password])
      login(@user)
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end
end
