class UsersController < ApplicationController
  include Respondable

  skip_before_action :verify_authenticity_token
  before_action :find_user, only: %i[follow unfollow]

  def index
    @users = User.where.not(id: current_user.id)
    @users = current_user.following if params[:sort_type] == 'followed'
    respond_index_json('user', 'user')
  end

  def show
    @user = User.find(params[:id])
    @users = (@user.following | @user.followers)
  end

  def follow
    current_user.follow(@user)
    redirect_to users_path
  end

  def unfollow
    authorize @user
    current_user.unfollow(@user)
    redirect_to users_path
  end

  def settings; end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
