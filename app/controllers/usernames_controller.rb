class UsernamesController < ApplicationController
  def create
    discussion = find_discussion
    @username = set_guest_username
  end

  private

  def find_discussion
    Discussion.find_by(token: params[:discussion_id])
  end

  def set_guest_username
    cookies[:username] = params[:guest][:username]
  end
end
