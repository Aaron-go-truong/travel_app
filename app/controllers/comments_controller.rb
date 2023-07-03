class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_plan, only: %i[create update destroy]
  before_action :find_comment, only: %i[update destroy]

  def create
    @comment = Comment.new(comment_params.merge({ plan_id: @plan.id, user_id: current_user.id }))
    @comment.cmt_parent_id = params[:cmt_parent_id].delete('value ') unless params[:cmt_parent_id].delete('value ').nil?

    if @comment.save
      redirect_to plan_path(@plan)
    end
  end

  def update
    @comment.update(comment_params)
    redirect_to plan_path(@plan)
  end

  def destroy
    @comment.destroy
    redirect_to plan_path(@plan)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :cmt_parent_id)
  end

  def find_plan
    @plan = Plan.find(params[:plan_id])
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end
end
