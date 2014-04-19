class DashboardsController < ApplicationController
  before_action :authorize

  def show
    @discussions = current_user.discussions
  end
end
