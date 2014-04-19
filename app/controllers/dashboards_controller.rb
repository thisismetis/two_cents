class DashboardsController < ApplicationController
  before_filter :authorize

  def show
    @discussions = current_user.discussions
  end
end
