class CommentsController < ApplicationController
  before_action :find_plan, only: %i[create destroy]
  before_action :find_comment, only: %i[destroy]
  def create
    Comment.new(comment_params.merge({ plan_id: @plan.id, user_id: current_user.id}))

    if @comment.save
      redirect_to plan_path(@plan)
    end
  end

  def destroy
    @comment.destroy
    redirect_to plan_path(@plan)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_plan
    @plan = Plan.find(params[:plan_id])
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end
end
