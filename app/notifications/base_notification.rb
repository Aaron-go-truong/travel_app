class BaseNotification < Noticed::Base
  deliver_by :database
  deliver_by :action_cable, format: :cable

  def cable
    {
      notification: ApplicationController.renderer.render(
        partial: 'notifications/notification',
        locals: {
          notification: recipient.notifications.newest_first
        }
      ),
      counter: recipient.notifications.unread.size
    }
  end
end
