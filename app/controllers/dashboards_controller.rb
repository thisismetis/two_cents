class DashboardsController < ApplicationController
  def show
    @discussions = Discussion.all
    @discussion = Discussion.find_by(params[:discussion_id])
  end
end
