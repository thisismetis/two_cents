class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    super || Guest.new(cookies[:username])
  end

  def process_update(subject)
    PushUpdate.new(subject).push_update
  end
end
