class DiscussionsController < ApplicationController
  def new
    @discussion = Discussion.new
  end

  def create
    @discussion = current_user.discussions.create(discussion_params)
    redirect_to @discussion
  end

  def show
    @discussion = Discussion.find(params[:id])
    @photo = @discussion.photo
  end

  private

  def discussion_params
    params.require(:discussion).permit(:name, :photo)
  end
end
