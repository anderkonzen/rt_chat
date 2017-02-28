class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to messages_index_url
    else
      flash.now[:danger] = 'Invalid username and/or password'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end

end
