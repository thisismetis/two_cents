class DiscussionsController < ApplicationController
  def new
    @discussion = Discussion.new
  end

  def create
    discussion = current_user.discussions.create(discussion_params)
    redirect_to discussion
  end

  def show
    @discussion = find_discussion
  end

  private

  def find_discussion
    Discussion.find(params[:id])
  end

  def discussion_params
    params.require(:discussion).permit(:name)
  end
end
