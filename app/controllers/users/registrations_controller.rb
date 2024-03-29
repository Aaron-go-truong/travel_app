# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  include Respondable
  skip_before_action :verify_authenticity_token
  before_action :find_user, only: %i[update]

  def update
    if @user.update(user_params)
      flash.now[:notice] = 'Field successfully updated'
      respond_index_json('shared/flash', 'shared/flash')
      redirect_to edit_user_registration_path
    else
      flash.now[:alert] = 'Field can\'t update'
      respond_index_json('shared/flash', 'shared/flash')
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
