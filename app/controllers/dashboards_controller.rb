class DashboardsController < ApplicationController
  before_action :authorize

  def show
    @discussions = get_open_discussions
    @closed_discussions = get_closed_discussions
  end

  private

  def get_open_discussions
    Discussion.all_open(current_user)
  end

  def get_closed_discussions
    Discussion.all_closed(current_user)
  end
end
