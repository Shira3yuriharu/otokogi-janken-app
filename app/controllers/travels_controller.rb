class TravelsController < ApplicationController
  def new
    @travel = Travel.new
    # @groups = current_user.Group.all
    # current_user_id = current_user.id
    # group_users = GroupUser.where(user_id: current_user_id)
    # @group = Group.where(id: group_users.group_id)

    # current_user_belong_to_group = GroupUser.where( user_id: current_user.id )
    # @group = Group.where( id: "22")
    # ↓groups→groupに変更
    @group = current_user.groups.each do |group|
    end

  end

  def create
    @travel = Travel.new(travel_params)
    # binding.pry
    if @travel.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def travel_params
    params.require(:travel).permit(:name, :start_day, :end_day, :group_id)
  end

end
