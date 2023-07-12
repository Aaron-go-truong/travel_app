class Admin::PlansController < Admin::BaseController
  include Respondable
  skip_before_action :verify_authenticity_token, only: %i[update_status]
  before_action :find_plan, only: %i[update_status]

  def index
    @plans = Plan.all.plan_parent.order(:id)
  end

  def update_status
    @plan.update(deactivated: !@plan.deactivated)
    flash.now[:notice] = 'Status changed successfully.'
    respond_index_json('shared/flash','shared/flash')
  end

  private

  def find_plan
    @plan = Plan.find(params[:id])
  end
end
