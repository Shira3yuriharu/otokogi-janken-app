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

    # 円グラフ
    # @results = Result.all
    @travel = TravelSelect.where(travel_id: params[:id])
    @travel_select_pie = Result.where(travel_select_id: @travel.ids)

    # 価格合計表示
    @results_nickname_sum = Result.group(:nickname).sum(:money) 
      @key0 = @results_nickname_sum.keys[0]
      @value0 = @results_nickname_sum.values[0]
      @key1 = @results_nickname_sum.keys[1]
      @value1 = @results_nickname_sum.values[1]
      @key2 = @results_nickname_sum.keys[2]
      @value2 = @results_nickname_sum.values[2]
      @key3 = @results_nickname_sum.keys[3]
      @value3 = @results_nickname_sum.values[3]
      @key4 = @results_nickname_sum.keys[4]
      @value4 = @results_nickname_sum.values[4]
  end

  def checked
    @travel = TravelSelect.where(travel_id: params[:id])
    @travel_select_pie = Result.where(travel_select_id: @travel.ids)
    render json: { post: @travel_select_pie }
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
  end

  private

  def result_params
    params.require(:result).permit(:nickname, :money, :item_category_id, :note, :image).merge(travel_select_id: @travel_select_last_id)
  end

end
