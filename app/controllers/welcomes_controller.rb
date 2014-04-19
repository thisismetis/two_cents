class WelcomesController < ApplicationController
  before_action :goto_dashboard, if: :signed_in?

  def show
    @user = User.new
  end

  private

  def goto_dashboard
    redirect_to dashboard_path
  end
end
