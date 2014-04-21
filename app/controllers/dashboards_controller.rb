class DashboardsController < ApplicationController
  before_action :authorize

  def show
    @open_discussions = open_discussions
    @closed_discussions = closed_discussions
  end

  private

  def open_discussions
    current_user.discussions.open
  end

  def closed_discussions
    current_user.discussions.closed
  end
end
