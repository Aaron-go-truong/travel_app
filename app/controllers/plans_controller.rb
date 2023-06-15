class PlansController < ApplicationController
  before_action :find_plan, only: %i[show update destroy]

  def index
    @plans = Plan.where(plan_parent_id: nil)
    @plans = @plans.where(user_id: params[:user_id]) if params[:user_id].present?
  end

  def show; end

  def new
    @plan = Plan.new(user_id: current_user.id)
  end

  def create
    @plan = Plan.new(plan_params)
    @plan.user_id = current_user.id
    @plan.plan_parent_id = params[:plan_parent_id].split.last unless params[:plan_parent_id][-1].blank?

    if @plan.save
      @plan.image_description.attach(plan_params[:image_description])

      if @plan.plan_parent_id.nil?
        redirect_to plans_path
      else
        redirect_to Plan.find(@plan.plan_parent_id)
      end
    elsif @plan.plan_parent_id.nil?
      render plans_path
    else
      render :edit
    end
  end

  def edit; end

  def update
    if @plan.update(plan_params)
      if @plan.plan_parent_id.nil?
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
    if @plan.plan_parent_id.nil?
      redirect_to plans_path
    else
      redirect_to Plan.find(@plan.plan_parent_id)
    end
  end

  private

  def plan_params
    params.require(:plan).permit(:title, :amount, :descriptions, :plan_audience, :address, :time, :activities, :notes, :vehicles, :image_description)
  end

  def find_plan
    @plan = Plan.find(params[:id])
  end
end
