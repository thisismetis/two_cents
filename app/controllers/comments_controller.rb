class CommentsController < ApplicationController
  respond_to :js, :html

  def create
    discussion = find_discussion
    comment = discussion.comments.create(comment_params)
    process_update(comment)
  end

  private

  def comment_params
    params.require(:comment).
      permit(
        :body,
        :username
      )
  end

  def find_discussion
    Discussion.find(params[:discussion_id])
  end
end
