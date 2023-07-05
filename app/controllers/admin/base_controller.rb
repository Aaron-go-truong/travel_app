class Admin::BaseController < ApplicationController
  before_action :authenticate_user!, :check_admin_access!

  private

  def check_admin_access!
    authorize(:gateway, :admin_namespace?)
  end
end
