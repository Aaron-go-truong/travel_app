class Admin::UsersManagementController < Admin::BaseController
  skip_before_action :verify_authenticity_token, only: %i[update_status]
  before_action :find_user, only: %i[update_status]

  def index
    @users = User.with_role(:user).order(:id)
  end

  def update_status
    @user.update(deactivated: !@user.deactivated)
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
