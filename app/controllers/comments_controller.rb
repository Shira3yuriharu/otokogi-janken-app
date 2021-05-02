class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/travels/#{comment.travel.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, travel_id: params[:travel_id])
  end
end
