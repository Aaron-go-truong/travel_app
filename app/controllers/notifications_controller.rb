class NotificationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def update
    @notification = Notification.find(params[:id])
    @notification.update(read_at: Time.zone.now)
    redirect_to params[:url]
  end

  def mark_all_as_read
    Notification.where(recipient_id: current_user.id).update_all(read_at: Time.zone.now)
    redirect_to params[:url]
  end
end
