class DiscussionsController < ApplicationController

  def new
    @discussion = Discussion.new
  end
end
