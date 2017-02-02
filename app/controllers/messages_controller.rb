class MessagesController < ApplicationController
  def index
    @messages = Message.all
    @message = Message.new
  end

  def create
    @messages = Message.all
    msg = params[:message].permit(:body)
    prm = msg.merge(create_params)
    Message.create(prm)
    redirect_to group_messages_path
  end

  private
  def create_params
    params.permit(:group_id).merge(user_id: current_user.id)
  end
end
