class DiscussionsController < ApplicationController
  def new
    @discussion = Discussion.new
  end

  def create
    @discussion = current_user.discussions.create(discussion_params)
    @discussion.photo = params[:discussion][:photo]
    @discussion.save
    redirect_to @discussion
  end

  def show
    @discussion = Discussion.find(params[:id])
    @photo = @discussion.photo
  end

  private

  def discussion_params
    params.require(:discussion).permit(:name)
  end
end
