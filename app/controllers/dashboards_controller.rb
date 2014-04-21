class DashboardsController < ApplicationController
  before_action :authorize

  def show
    @open_discussions = open_discussions
    @closed_discussions = closed_discussions
    @open_collaborations = open_collaborations
    @closed_collaborations = closed_collaborations
  end

  private

  def open_discussions
    current_user.discussions.open
  end

  def closed_discussions
    current_user.discussions.closed
  end

  def open_collaborations
    current_user.collaborated_discussions.open
  end

  def closed_collaborations
    current_user.collaborated_discussions.closed
  end
end
