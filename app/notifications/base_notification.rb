class BaseNotification < Noticed::Base
  deliver_by :database
  deliver_by :action_cable, format: :cable_comment

  def cable_comment
    {
      notification: ApplicationController.renderer.render(
        partial: 'notifications/notification',
        locals: {
          notification: recipient.notifications.newest_first.first
        }
      ),
      counter: recipient.notifications.unread.size
    }
  end
end
