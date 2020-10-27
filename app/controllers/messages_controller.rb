class MessagesController < ApplicationController
  def new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      @user = @message.user
      ActionCable.server.broadcast 'message_channel', content: @message, user: @user
    end
  end

  private

  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
