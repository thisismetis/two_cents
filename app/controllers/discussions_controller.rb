class DiscussionsController < ApplicationController
  respond_to :html

  def new
    @discussion_form = DiscussionForm.new
    @content = @discussion_form
    @types = ["Image", "Document", "Code", "Video", "Audio"]
  end

  def show
    @discussion = Discussion.find_by(token: params[:id])
    @comments = @discussion.comments.recent
    @comment = Comment.new
    @content = @discussion.content
  end

  def create
    @discussion_form = DiscussionForm.new(form_params)
    @content = @discussion_form.persist
    @types = ["Image", "Document", "Code", "Video", "Audio"]
    respond_with @content, location: @content.discussion
  end

  private

  def form_params
    params.require(:discussion_form).
      permit(
        :name,
        :type,
        :subject
        ).
      merge(user: current_user)
  end

  def discussion_params
    params.require(:discussion).permit(:name)
  end

end
