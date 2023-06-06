# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  skip_before_action :verify_authenticity_token
  before_action :find_user, only: %i[update_profile]

  def update_profile
    if @user.update(user_params)
      redirect_to edit_user_registration_path
    else
      render edit_user_registration_path
    end
  end

  private

  def find_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:full_name, :address, :gender, :date_of_birth)
  end
end
