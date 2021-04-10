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
      # ↓もともとのコード！
      # @nicknames = User.where(id: @user_ids).select('nickname')
      # @nicknames = User.where(id: @user_ids)
    end

  end

  def create
    @user = User.find(current_user.id)
    @travel_select_last = TravelSelect.where(user_id: @user).last
    @travel_select_last_id = @travel_select_last.id

    @result = Result.new(result_params)
    if @result.save
      redirect_to root_path
    else
      redirect_to new_result_path
    end
    
    # binding.pry
  end

  private

  def result_params
    params.require(:result).permit(:nickname, :money, :item_category_id, :note, :image).merge(travel_select_id: @travel_select_last_id)
  end

end
