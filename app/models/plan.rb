class Plan < ApplicationRecord
  has_one_attached :image_description

  has_many :plan_details, class_name: 'Plan', foreign_key: :plan_parent_id, dependent: :destroy
  belongs_to :plan_parent, class_name: 'Plan'
  belongs_to :user
  # Returns true if the current plan include the other plan.
  def include_plan?(other_plan)
    plan_details.include?(other_plan)
  end
end
