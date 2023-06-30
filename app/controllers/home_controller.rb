class HomeController < ApplicationController
  def index
    @plans = Plan.where(user_id: current_user.id).plan_parent
  end
end
