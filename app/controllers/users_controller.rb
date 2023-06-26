class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_user, only: %i[follow unfollow]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    mark_notifications_as_read
  end

  def follow
    current_user.follow(@user)
    redirect_to users_index_path
  end

  def unfollow
    current_user.unfollow(@user)
    redirect_to users_index_path
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def mark_notifications_as_read
    if current_user
      notification_to_mark_as_read = @user.notifications_as_user.where(recipient: current_user)
      notification_to_mark_as_read.update_all(read_at: Time.zone.now)
    end
  end
end
