class DashboardsController < ApplicationController
  def show
    @discussions = current_user.discussions
  end
end
