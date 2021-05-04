class TravelSelectsController < ApplicationController
 
  def new
    @travel_select = TravelSelect.new

    @user = User.find(current_user.id)
    @groups = GroupUser.where(user_id: @user)
    @group_ids = @groups.select(:group_id)
    @travels_id = Travel.where(group_id: @group_ids).last
    if @travels_id.nil?
      redirect_to new_travel_path
    else
      @travels = Travel.where(group_id: @group_ids)
    end
  end

  def create
    @travel_select = TravelSelect.new(travel_select_params)
    if @travel_select.save
      redirect_to root_path
    else
      redirect_to new_travel_select_path
    end
  end

  private
  def travel_select_params
    params.require(:travel_select).permit(:travel_id).merge(user_id: current_user.id)
  end

end
