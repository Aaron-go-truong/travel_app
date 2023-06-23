class PlanNotification < BaseNotification
  def message
    @plan = Plan.find(params[:plan][:id])
    ' added new plan.'
  end

  def url
    plan_path(params[:plan])
  end
end
