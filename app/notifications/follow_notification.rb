class FollowNotification < BaseNotification
  def message
    ' followed you.'
  end

  def url
    "/users/#{params[:relationship][:follower_id]}"
  end
end
