class TravelsController < ApplicationController
  def new
    @travel = Travel.new
    # @groups = current_user.Group.all
    # current_user_id = current_user.id
    # group_users = GroupUser.where(user_id: current_user_id)
    # @group = Group.where(id: group_users.group_id)

    # current_user_belong_to_group = GroupUser.where( user_id: current_user.id )
    # @group = Group.where( id: "22")
    # ↓groups→groupに変更
    # @groups = current_user.groups.each do |group|
    @user = User.find(current_user.id)
    @groups = GroupUser.where(user_id: @user)
    @groups_check = @groups.last
    
    if @groups_check.nil?
      redirect_to new_group_path
    else
      @groups = current_user.groups.each do |group|
      end
    end

  end

  def create
    @travel = Travel.new(travel_params)
    if @travel.save
      redirect_to root_path
    else
      redirect_to new_travel_path
    end
  end

  def show
    # 表及び画像表示
    @travel =Travel.find(params[:id])
    @travel_select = TravelSelect.where(travel_id: @travel.id)
    @results = Result.where(travel_select_id: @travel_select.ids)
    # コメント表示
    @comment = Comment.new
    @comments = @travel.comments.includes(:user)
  end

  private
  def travel_params
    params.require(:travel).permit(:name, :start_day, :end_day, :group_id)
  end

end
