class MessagesController < ApplicationController
  def index
    @messages = Message.all
    @message = Message.new
  end

  def create
    @messages = Message.all
    prm = params[:message].permit(:body).merge(create_params)
    create_msg = Message.create(prm)
    if create_msg.valid?
      redirect_to group_messages_path
    else
      redirect_to group_messages_path, alert: create_msg.errors.full_messages[0]
    end
  end

  private
  def create_params
    params.permit(:group_id).merge(user_id: current_user.id)
  end
end
