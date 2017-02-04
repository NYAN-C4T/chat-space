class MessagesController < ApplicationController
  before_action :get_group_messages, only: %i(index create)

  def index
    @message = Message.new
  end

  def create
    @message = @messages.build(message_params)
    if @message.save
      redirect_to group_messages_path(@message.group_id)
    else
      flash.now[:alert] = @message.errors.full_messages[0]
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:body).merge(user_id: current_user.id)
  end

  def get_group_messages
    @messages = Message.where(params[:group_id])
  end
end

