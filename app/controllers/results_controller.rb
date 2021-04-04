class ResultsController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @travel_select_last = TravelSelect.where(user_id: @user).last
    @travel_select_last_travel_id = @travel_select_last.travel_id
    @travel_name = Travel.find(@travel_select_last_travel_id).name
  end
end
