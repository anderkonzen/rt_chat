class MessagesController < ApplicationController
  before_action :user_logged_in?

  def index
    @messages = Message.all.order(:created_at)
    @message = Message.new
  end

  def create
    @message = current_user.messages.build(message_params)
    if @message.save
      redirect_to messages_url
    else
      render 'index'
    end
  end

  private

  def user_logged_in?
    unless logged_in?
      flash[:danger] = 'Please log in to send messages!'
      redirect_to login_path
    end
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
