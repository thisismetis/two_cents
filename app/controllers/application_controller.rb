class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    super || Guest.new(cookies[:username])
  end

  def process_comment(comment)
    CommentPush.new(comment).push_comment_update
    if current_user.can_collaborate?(comment.discussion)
      current_user.collaborations.create(discussion: comment.discussion)
    end
  end
end
