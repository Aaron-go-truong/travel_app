class LikeNotification < BaseNotification

  def message
    @like = Like.find(params[:like][:id])
    " reacted to your #{@like.likeable_type.downcase }."
  end

  def url
    @like = Like.find(params[:like][:id])
    if @like.likeable_type=="Comment"
      plan_path(Plan.find(@like.likeable.plan_id))
    else
      plan_path(@like.likeable)
    end
  end

end
