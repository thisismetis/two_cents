class CommentsController < ApplicationController
  respond_to :html

  def create
    discussion = find_discussion
    comment = discussion.comments.create(comment_params)
    respond_with comment, location: discussion
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
    Discussion.find_by(token: params[:discussion_id])
  end
end
