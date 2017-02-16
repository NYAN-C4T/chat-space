class MessagesController < ApplicationController
  before_action :get_messages, only: %i(index create)

  def index
    @message = Message.new
  end

  def create
    @message = @messages.new(message_params)
    if @message.save
      respond_to do |format|
        format.html {
          redirect_to group_messages_path(params[:group_id])
        }
        format.json {
          render json: {
              body: @message.body,
              user_id: @message.user_id,
              group_id: @message.group_id,
              name: current_user.name,
              created_at: @message.created_at.strftime("%Y/%m/%d %H:%M:%S"),
          }
        }
      end
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


# Object {id: 49, body: "asdf", image: null, user_id: 2, group_id: 1…}