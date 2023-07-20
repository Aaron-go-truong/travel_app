class PlansController < ApplicationController
  include Respondable
  skip_before_action :verify_authenticity_token
  before_action :find_plan, only: %i[show edit update destroy]
  before_action :filter_plan, only: %i[index]

  def index
    @plans = @plans.where(user_id: params[:user_id]).plan_parent if params[:user_id].present?
    if params[:sort_type].present?
      @plans =
        case params[:sort_type]
        when 'oldest'
          @plans.sort_oldest
        when 'most_like'
          @plans.sort_most_like
        else
          @plans
        end
    end
    @plans = @plans.filter_by_status(params[:status_type]) if params[:status_type].present? && params[:status_type] != 'all'
    respond_index_json('plan', 'create_plan')
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
        redirect_to plan_path(@plan)
      else
        redirect_to Plan.find(@plan.plan_parent_id)
      end
    else
      render :new
    end
  end

  def edit
    authorize @plan
  end

  def update
    authorize @plan
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
    authorize @plan
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

  def filter_plan
    @plans = Plan.plan_parent.plan_active.sort_most_recent
    @plans = @plans.favourite_plans(current_user.id) if params[:page] == 'favourite'
    if params[:search_content].present?
      @plans = @plans.includes(:user).filter_by_title(params[:search_content]).or(@plans.includes(:user).filter_by_username(params[:search_content]))
    end
  end
end
