class FollowNotification < BaseNotification

  def message
    " followed you."
  end

  def url
    # @user = User.find(params[:relationship][:follower_id])
    # users_index_path(@user.id)
    "/users/#{params[:relationship][:follower_id]}"
  end

end
