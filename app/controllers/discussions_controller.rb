class DiscussionsController < ApplicationController
  respond_to :html

  def new
    @discussion = Discussion.new

  end

  def create
    discussion = current_user.discussions.create(discussion_params)
    respond_with discussion
  end

  def show
    @discussion = find_discussion
    @content = @discussion.contents.last || NullContentObject.new
  end

  private

  def find_discussion
    Discussion.find(params[:id])
  end

  def discussion_params
    params.require(:discussion).
      permit(
        :name
      )
  end
end
