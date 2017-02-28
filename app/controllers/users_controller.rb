class UsersController < ApplicationController
  def new
    if logged_in?
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to messages_url
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
