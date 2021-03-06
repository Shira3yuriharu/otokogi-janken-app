class ResultsController < ApplicationController

  def index
      @user = User.find(current_user.id)
      @travel_select_last = TravelSelect.where(user_id: @user).last
        if @travel_select_last.nil?
          @travel_name = "環境構築③を実行ください"
        else
          @travel_select_last_travel_id = @travel_select_last.travel_id
          @travel_name = Travel.find(@travel_select_last_travel_id).name
        end
    @travel = TravelSelect.where(travel_id: params[:id])
    @travel_select_pie = Result.where(travel_select_id: @travel.ids)
    # 価格合計表示（非同期通信で使用）
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

  def checked2
    @travels = Travel.where(group_id: params[:id])
    @travel_selects = TravelSelect.where(travel_id: @travels)
    @results = Result.where(travel_select_id: @travel_selects.ids)
    render json: { post: @results }
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
      @travel_name = Travel.find(@travel_select_last_travel_id).name
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

  def destroy
    result = Result.find(params[:id])
    result.destroy
    redirect_to root_path
  end

  def edit
    @result = Result.find(params[:id])
    @travel = TravelSelect.where(id: @result.travel_select_id).last
    @group_id = Travel.where(id: @travel.travel_id).select('group_id')
    @user_ids = GroupUser.where(group_id: @group_id).select('user_id')
    # 結果に紐付いているユーザー及びGrメンバー以外は編集ページへ遷移不可にする
    result_select_id = @result.travel_select_id
    travel_id = TravelSelect.where(id: @result.travel_select_id).select(:travel_id)
    group_id = Travel.where(id: travel_id).select(:group_id)
    user_ids = GroupUser.where(group_id: group_id)
    unless user_ids.select(:user_id).where(user_id: current_user.id).exists?
      redirect_to root_path
    end
  end

  def update
    @result = Result.find(params[:id])
    @travel = TravelSelect.where(id: @result.travel_select_id).last
    @travel_select_last_id = @travel.id

    result = Result.find(params[:id])
      if result.update(result_params)
        redirect_to root_path
      else
        redirect_to edit_result_path
      end
  end

  private
  def result_params
    params.require(:result).permit(:nickname, :money, :item_category_id, :note, :image).merge(travel_select_id: @travel_select_last_id)
  end

end
