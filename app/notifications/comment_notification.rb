# To deliver this notification:
#
# CommentNotification.with(post: @post).deliver_later(current_user)
# CommentNotification.with(post: @post).deliver(current_user)

class CommentNotification < Noticed::Base
  # Add your delivery methods
  #
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
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  # param :plan

  # Define helper methods to make rendering easier.
  #
  def message
    @plan = Plan.find(params[:comment][:plan_id])
    @comment = Comment.find(params[:comment][:id])
    @user = User.find(@comment.user_id)

    " commented on your plan."
  end

  def url
    plan_path(Plan.find(params[:comment][:plan_id]))
  end
end
