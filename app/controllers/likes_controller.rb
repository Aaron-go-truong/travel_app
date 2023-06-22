class LikesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_plan, only: %i[create destroy]
  before_action :find_like, only: %i[destroy]

  def create
    @like = Like.create(like_params.merge(user_id: current_user.id))
    redirect_to plan_path(@plan)
  end

  def destroy
    @like.destroy
    redirect_to plan_path(@plan)
  end

  private

  def like_params
    params.require(:like).permit(:likeable_id, :likeable_type)
  end

  def find_plan
    @plan = Plan.find(params[:plan_id])
  end

  def find_like
    @like = Like.where(user_id: current_user.id, likeable_id: params[:like][:likeable_id]).first
  end
end
