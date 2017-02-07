class MessagesController < ApplicationController
  before_action :get_messages, only: %i(index create)

  def index
    @message = Message.new
  end

  def create
    @message = @messages.new(message_params)
    if @message.save
      redirect_to group_messages_path(params[:group_id])
    else
      flash.now[:alert] = @message.errors.full_messages[0]
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:body).merge(user_id: current_user.id)
  end

  def get_messages
    @groups = Group.all
    @messages = Message.where(group_id: params[:group_id])
  end
end
