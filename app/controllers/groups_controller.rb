class GroupsController < ApplicationController
  def new
    @group = Group.new(id: params[:id], group_name: params[:name])
    # @group.group_users.build
  end

  def create
    Group.create(create_params)
    binding.pry
    render :template => "messages/index"
  end

  private
  def create_params
    params.require(:group).permit(:group_name, {:user_ids => []})
  end
end
