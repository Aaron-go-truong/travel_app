class PlansController < ApplicationController
  include Respondable
  before_action :find_plan, only: %i[show update destroy]

  def index
    @plans = Plan.where.not(user_id: current_user.id).plan_parent.sort_most_recent
    @plans = @plans.filter_by_title(params[:search_content]) if params[:search_content].present?
    if params[:sort_type].present?
      @plans = @plans.sort_most_recent() if  params[:sort_type]=="most_recent"
      @plans = @plans.sort_oldest() if  params[:sort_type]=="oldest"
      @plans = @plans.sort_most_like() if  params[:sort_type]=="most_like"
    end

    respond_index_json
  end

  def show; end

  def new
    @plan = Plan.new(user_id: current_user.id)
    @plan.plan_details.build unless @plan.plan_details.build.present?
  end

  def create
    @plan = Plan.new(plan_params.merge(user_id: current_user.id))
    @plan.plan_details.map { |detail| detail.user_id = @plan.user_id }
    @plan.plan_parent_id = params[:parent_id].delete('value ') if params[:parent_id].delete('value ').present?

    if @plan.save
      @plan.image_description.attach(plan_params[:image_description])

      if @plan.plan_parent?
        redirect_to plans_path
      else
        redirect_to Plan.find(@plan.plan_parent_id)
      end
    elsif @plan.plan_parent?
      render plans_path
    else
      render :edit
    end
  end

  def edit; end

  def update
    if @plan.update(plan_params)
      if @plan.plan_parent?
        redirect_to @plan
      else
        redirect_to Plan.find(@plan.plan_parent_id)
      end
    else
      render :edit
    end
  end

  def destroy
    @plan.destroy
    if @plan.plan_parent?
      redirect_to plans_path
    else
      redirect_to Plan.find(@plan.plan_parent_id)
    end
  end

  private

  def plan_params
    params.require(:plan).permit(
      :title,
      :amount,
      :descriptions,
      :plan_audience,
      :address,
      :time,
      :activities,
      :notes,
      :vehicles,
      :image_description,
      plan_details_attributes: [
        :title,
        :amount,
        :descriptions,
        :plan_audience,
        :address,
        :time,
        :activities,
        :notes,
        :vehicles,
        :image_description,
        :user_id,
        :plan_parent_id
      ]
    )
  end

  def find_plan
    @plan = Plan.find(params[:id])
  end
end
