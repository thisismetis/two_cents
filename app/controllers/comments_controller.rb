class CommentsController < ApplicationController
  include Tubesock::Hijack
  respond_to :js, :html

  def create
    discussion = find_discussion
    @comment = discussion.comments.create(comment_params)
    hijack do |tubesock|
      tubesock.onmessage do |data|
        tubesock.send_data comment
      end
    end
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
