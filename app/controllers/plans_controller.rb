class PlansController < ApplicationController
  def index
    @plans = current_user.plans
  end

  def new
    @plan = current_user.plans.new
  end

  def show
    @plan = current_user.plans.find(params[:id])
  end

  def create
    @plan = current_user.plans.new(plan_params)
    if @plan.save
      @plan.image_description.attach(plan_params[:image_description])
      redirect_to plans_path
    else
      render plans_path
    end
  end

  def edit; end

  def update
    @plan = current_user.plans.find(params[:id])
    if @plan.update(plan_params)
      redirect_to @plan
    else
      render :edit
    end
  end

  private

  def plan_params
    params.require(:plan).permit(:title, :amount, :descriptions, :plan_audience, :address, :time, :activities, :notes, :vehicles, :image_description)
  end
end
