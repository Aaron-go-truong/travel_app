# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :find_user, only: %i[update_fullname]

  def update_fullname
    if @user.update(params[:full_name])
      redirect_to :edit
    else
      render :edit
    end
  end

  private
  def find_user
    @user = User.find(current_user.id)
  end
end
