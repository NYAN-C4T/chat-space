class MessagesController < ApplicationController
  before_action :get_group_messages, only: %i(index create)

  def index
  end

def create
  msg = Message.create(body: message_params[:body], group_id: params[:group_id], user_id: current_user.id)
  if msg.persisted?
    redirect_to group_messages_path
  else
    flash.now[:alert] = msg.errors.full_messages[0]
    render :index
  end
end

  private
  def message_params
    params.require(:message).permit(:body)
  end

  def get_group_messages
    @message = Message.new
    @messages = Message.includes(:user).where(group_id: params[:group_id])
  end
end

