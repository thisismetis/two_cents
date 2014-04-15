class ContentsController < ApplicationController
  respond_to :html

  def new
    @content = Content.new
    @discussion = find_discussion
  end

  def create
    @discussion = find_discussion
    @content = @discussion.contents.create(content_params)
    respond_with @content, location: @discussion
  end

  private

  def find_discussion
    Discussion.find(params[:discussion_id])
  end

  def content_params
    params.require(:content).
      permit(
        :url
      )
  end
end
