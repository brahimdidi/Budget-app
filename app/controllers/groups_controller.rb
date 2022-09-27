class GroupsController < ApplicationController 
  def index
    @groups  = Group.all.where(user: current_user)
  end
end