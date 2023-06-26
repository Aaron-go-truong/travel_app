class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :set_notifications, if: :current_user

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: %i[avatar])
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[user_name avatar])
  end

  def set_notifications
    @notifications = Notification.where(recipient: current_user).newest_first.limit(9)
    @unread = @notifications.unread
    @read = @notifications.read
  end
end
