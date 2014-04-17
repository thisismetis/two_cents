class DiscussionsController < ApplicationController

  def new
    @content_discussion_form = ContentDiscussionForm.new
  end

  def create
    @discussion = current_user.discussions.create(discussion_params)
    redirect_to @discussion
  end

  def show
    @discussion = Discussion.find(params[:id])
    @comments = @discussion.comments
    @comment = Comment.new
    @content = @discussion.content
  end

  private

  def discussion_params
    params.require(:discussion).permit(:name)
  end

end
