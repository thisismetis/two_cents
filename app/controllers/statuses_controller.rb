class StatusesController < ApplicationController
  def update
    discussion = current_user.discussions.find_by(token: params[:discussion_id])
    discussion.close
    redirect_to dashboard_path
  end
end

