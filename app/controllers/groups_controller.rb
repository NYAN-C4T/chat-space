class GroupsController < ApplicationController
  def index
    redirect_to root_path
  end

  def new
    @group = Group.new
  end

  def create
    if Group.create(create_params)
      redirect_to groups_path, notice: 'グループを登録しました。'
    else
      render new_group_path
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(create_params)
      redirect_to groups_path, notice: 'グループを編集しました。'
    else
      render :edit
    end
  end

  private
  def create_params
    params.require(:group).permit(:group_name, {user_ids: []})
  end
end
