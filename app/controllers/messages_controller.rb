require 'translator'

class MessagesController < ApplicationController
  before_action :user_logged_in?

  def index
    @messages = Message.all.order(:created_at)
    @message = Message.new
  end

  def create
    @message = current_user.messages.build(message_params)
    if @message.save
      ActionCable.server.broadcast 'room_channel', message: render_message(@message)
      head :ok
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
    params[:message][:content] = Translator.translate(params[:message][:content], params[:dialect])
    params.require(:message).permit(:content)
  end

  def render_message(message)
    render(partial: 'message', locals: { message: message })
  end
end
