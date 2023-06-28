# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  skip_before_action :verify_authenticity_token
  before_action :find_user, only: %i[update]

  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     redirect_to new_user_session_path
  #   else
  #     redirect_to new_user_session_path
  #   end
  # end

  def update
    if @user.update(user_params)
      flash[:notice] = 'Field successfully updated'
      redirect_to edit_user_registration_path
    else
      flash[:alert] = 'Field can\'t update'
      render edit_user_registration_path
    end
  end

  private

  def find_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:email, :password, :user_name, :address, :gender, :date_of_birth, :avatar)
  end
end
