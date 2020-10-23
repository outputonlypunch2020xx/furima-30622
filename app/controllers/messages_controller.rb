class MessagesController < ApplicationController

  def new
  end

  def create
    #@message = Message.new(text: params[:message][:text])
    #if @message.save
      #ActionCable.server.broadcast 'message_channel', content: @message
    #end
    masseage = Message.create(message_params)
    redirect_to root_path
  end
  private
  def message_params
    message.require(:message).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
