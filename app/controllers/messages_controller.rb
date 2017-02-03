class MessagesController < ApplicationController
  before_action :get_group_messages, only: %i(index create)

  def index
    @message = Message.new
  end

  def create
    @message = Message.create(message_params)
    if @message.persisted?
      redirect_to group_messages_path(@message.group_id)
    else
      flash.now[:alert] = @message.errors.full_messages[0]
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:body).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  def get_group_messages
    @group = Group.find(params[:group_id])
    @messages = @group.messages
  end
end

