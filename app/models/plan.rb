class Plan < ApplicationRecord
  has_one_attached :image_description

  has_many :plan_childs, class_name: 'PlanDetail',
                                  foreign_key: 'plan_id',
                                  dependent: :destroy
  has_many :plan_parents, class_name: 'PlanDetail',
                                   foreign_key: 'plan_detail_id',
                                   dependent: :destroy
  has_many :plan_details, through: :plan_childs, source: :plan
  has_many :plans, through: :plan_parents, source: :plan_detail

  # adds a plan.
  def addPlan(other_plan)
    unless includePlan?(other_plan)
      plan_childs.create(plan_id: other_plan.id)
    end
  end

  # add plan
  def removePlan(other_plan)
    if includePlan?(other_plan)
      plan_childs.find_by(plan_detail_id: other_plan.id).destroy
    end
  end

  # Returns true if the current plan include the other plan.
  def includePlan?(other_plan)
    plan_details.include?(other_user)
  end
end
