class PlansController < ApplicationController
  before_action :find_plan, only: %i[show update]

  def index
    @plans = Plan.all
    @plans = @plans.where(user_id: params[:user_id]) if params[:user_id].present?
  end

  def show; end

  def new
    @plan = Plan.new(user_id: current_user.id)
  end

  def create
    @plan = Plan.new(plan_params)
    @plan.user_id = current_user.id

    if @plan.save
      @plan.image_description.attach(plan_params[:image_description])
      redirect_to plans_path
    else
      render plans_path
    end
  end

  def edit; end

  def update
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

  def find_plan
    @plan = Plan.find(params[:id])
  end
end
