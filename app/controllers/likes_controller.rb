class LikesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_plan, only: %i[create destroy]
  before_action :find_like, only: %i[destroy]

  def create
    @like = Like.create(user_id: current_user.id, comment_id: params[:comment_id], plan_id: params[:plan_id])
    redirect_to plan_path(@plan)
  end

  def destroy
    @like.destroy
    redirect_to plan_path(@plan)
  end

  private

  def find_plan
    @plan = Plan.find(params[:plan_id])
  end

  def find_like
    @like = Like.where(user_id: current_user.id, comment_id: params[:comment_id]).first unless params[:comment_id].nil?
    @like = Like.where(user_id: current_user.id, plan_id: params[:plan_id]).first unless params[:plan_id].nil?
  end
end
