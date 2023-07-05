class Admin::PlansManagementController < Admin::BaseController
  skip_before_action :verify_authenticity_token, only: %i[update_status]
  before_action :find_plan, only: %i[update_status]

  def index
    @plans = Plan.where.not(user_id: current_user.id).plan_parent.order(:id)
  end

  def update_status
    @plan.update(deactivated: !@plan.deactivated)
  end

  private

  def find_plan
    @plan = Plan.find(params[:id])
  end
end
