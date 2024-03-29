class MessagesController < ApplicationController

  
  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.save
  end

  private
  def message_params
    params.require(:message).permit(:body)
  end
end
