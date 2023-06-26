class CommentNotification < BaseNotification
  def message
    ' commented on your plan.'
  end

  def url
    plan_path(Plan.find(params[:comment][:plan_id]))
  end
end
