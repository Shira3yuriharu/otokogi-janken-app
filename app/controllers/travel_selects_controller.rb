class TravelSelectsController < ApplicationController
 
  def new
    @travel_select = TravelSelect.new
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
