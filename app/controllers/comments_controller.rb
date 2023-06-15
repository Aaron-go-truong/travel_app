class CommentsController < ApplicationController
  before_action :find_plan, only: %i[create destroy]

  def create
    @comment = @plan.comments.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to plan_path(@plan)
    end
  end

  def destroy
    @comment = @plan.comments.find(params[:id]).destroy
    redirect_to plan_path(@plan)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_plan
    @plan = Plan.find(params[:plan_id])
  end
end
