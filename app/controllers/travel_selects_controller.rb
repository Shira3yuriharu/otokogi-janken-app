class TravelSelectsController < ApplicationController
 
  def new
    @travel_select = TravelSelect.new

    @user = User.find(current_user.id)
    @groups = GroupUser.where(user_id: @user)
    @group_ids = @groups.select(:group_id)
    @travels = Travel.where(group_id: @group_ids)
    # @travel2 = 0
      # current_user.groups.each do |group|
        # @travel = group.travels.each do |travel|
          # @travel2 += @travel
        # end
      # end
    # binding.pry
  end

  def create
    @travel_select = TravelSelect.new(travel_select_params)
    if @travel_select.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def travel_select_params
    params.require(:travel_select).permit(:travel_id).merge(user_id: current_user.id)
  end

end
