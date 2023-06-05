# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  skip_before_action :verify_authenticity_token
  before_action :find_user, only: %i[update_fullname update_date_of_birth update_gender update_address]
  

  def update_fullname
    if @user.update(full_name: params[:full_name])
      redirect_to edit_user_registration_path
    else
      render edit_user_registration_path
    end
  end

  def update_date_of_birth
    if @user.update(date_of_birth: params[:date_of_birth])
      redirect_to edit_user_registration_path
    else
      render edit_user_registration_path
    end
  end

  def update_address
    if @user.update(address: params[:address])
      redirect_to edit_user_registration_path
    else
      render edit_user_registration_path
    end
  end

  def update_gender
    if @user.update(gender: params[:gender])
      redirect_to edit_user_registration_path
    else
      render edit_user_registration_path
    end
  end

  private
  def find_user
    @user = User.find(current_user.id)
  end

  # def user_params
  #   params.require(:user).permit(:full_name)
  # end
end
