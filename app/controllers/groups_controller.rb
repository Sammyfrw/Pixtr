class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def index
    @group = Group.all
    # @group_membership = GroupMembership.new
    @my_groups = current_user.groups
  end

  def create
      @group = Group.new(group_params)

      if @group.save
      GroupMembership.create(user_id: current_user.id,
      group_id: @group.id)
      redirect_to :groups
      else
        render :new
      end
  end

  def show
    @group = Group.find(params[:id])
    # # @image = Image.find(@group_image)
    # @group_image = GroupImage.all
  end

  def destroy
  end

private
  def group_params
    params.require(:group).permit(:name, :description)
  end
end
