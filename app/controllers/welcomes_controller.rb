class WelcomesController < ApplicationController
  def show
    @user = User.new
  end
end
