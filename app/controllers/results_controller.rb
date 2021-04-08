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

  def new
    @result = Result.new

    @user = User.find(current_user.id)
    @travel_select_last = TravelSelect.where(user_id: @user).last
    if @travel_select_last.nil?
      redirect_to new_travel_select_path
    else
      @travel_select_last_travel_id = @travel_select_last.travel_id
      @group_id = Travel.where(id: @travel_select_last_travel_id).select('group_id')
      @user_ids = GroupUser.where(group_id: @group_id).select('user_id')
      @nicknames = User.where(id: @user_ids).select('nickname')
    end
  end

  def create
    @result = Result.new(result_params)
    if @result.save
      redirect_to root_path
    else
      render :new
    end
    binding.pry
  end

  private

  def result_params
    params.require(:result).permit(:group_user_id,:money,:note).merge(travel_id: @travel_select_last_travel_id)
  end

end
