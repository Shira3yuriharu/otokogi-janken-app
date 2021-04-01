class TravelsController < ApplicationController
  def new
    @travel = Travel.new
    @groups = Group.all
  end

  def create
    @travel = Travel.new(travel_params)
    if @travel.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def travel_params
    params.require(:travel).permit(:name, :name2, :start_day, :end_day, :groupname)
  end

end
