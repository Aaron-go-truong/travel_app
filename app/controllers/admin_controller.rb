class AdminController < ApplicationController
  def index
    @users = User.all.where(role: 'user').order(:id)
    @plans = Plan.all.plan_parent.order(:id)
  end
end
