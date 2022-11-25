class GroupsController < ApplicationController
  def index
    @groups = Group.all.where(user: current_user)
  end

  def new
    @user = current_user
    group = Group.new
    respond_to do |format|
      format.html { render :new, locals: { group: } }
    end
  end

  def create
    @user = current_user
    @group = Group.new(group_params)
    @group.user = @user
    if @group.save
      flash[:notice] = "group #{@group.name} }was saved successfully"
      redirect_to user_groups_path(current_user)
    else
      flash.now[:notice] = 'Error:group could not be saved'
      render :new, locals: { group: @group }
    end
  end

  def group_params
    params.permit(:name, :icon, :user)
  end
end
