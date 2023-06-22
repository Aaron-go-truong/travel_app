class LikeNotification < BaseNotification

  def message
    @like = Like.find(params[:like][:id])
    " reacted to your comment." if  @like.plan_id.nil?
    " reacted to your plan." if  @like.comment_id.nil?
  end

  def url
    plan_path(Plan.find(params[:like][:plan_id]))
  end
end
