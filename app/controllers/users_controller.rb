class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_user, only: %i[follow unfollow update_status]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def follow
    current_user.follow(@user)
    redirect_to users_index_path
  end

  def unfollow
    current_user.unfollow(@user)
    redirect_to users_index_path
  end


  def update_status
    @user.update(deactivated: !@user.deactivated)

    respond_to do |format|
      format.html
      format.json { render json: @user.deactivated}
     end
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end
end
