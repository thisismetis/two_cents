class DiscussionsController < ApplicationController
  def new
    @discussion = Discussion.new
  end

  def create
    @discussion = current_user.discussions.create(discussion_params)
    redirect_to @discussion
  end

  def show
    @discussion = Discussion.find_by(token: params[:id])
    @comments = @discussion.comments
    @comment = Comment.new
    @photo = @discussion.photo
  end

  private

  def discussion_params
    params.require(:discussion).permit(:name, :photo)
  end
end
