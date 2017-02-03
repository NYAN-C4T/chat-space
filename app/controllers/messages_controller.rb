class MessagesController < ApplicationController
  before_action :get_group_messages, only:[:index, :create]

  def index
  end

  def create
    prm = params[:message].permit(:body).merge(message_params)
    msg = Message.create(prm)
    if msg.valid?
      redirect_to group_messages_path
    else
      flash.now[:alert] = msg.errors.full_messages[0]
      render :index
    end
  end

  private
  def message_params
    params.permit(:group_id).merge(user_id: current_user.id)
  end

  def get_group_messages
    @message = Message.new
    @messages = Message.includes(:user).where(group_id: 1)
  end
end
