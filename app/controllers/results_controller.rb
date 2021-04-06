class ResultsController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @travel_select_last = TravelSelect.where(user_id: @user).last
    if @travel_select_last.nil?
      @travel_name = "男気グループ未登録の為、表示できません"
    else
      @travel_select_last_travel_id = @travel_select_last.travel_id
      @travel_name = Travel.find(@travel_select_last_travel_id).name
    end
  end
end
