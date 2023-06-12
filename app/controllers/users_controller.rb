class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_user, only: %i[follow unfollow]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def follow
    current_user.follow(@target_user)
    redirect_to users_index_path
  end

  def unfollow
    current_user.unfollow(@target_user)
    redirect_to users_index_path
  end

  private

  def find_user
    @target_user = User.find(params[:user_id])
  end
end
