class PlanDetail < ApplicationRecord
  belongs_to :plan, class_name: 'Plan'
  belongs_to :plan_detail, class_name: 'Plan'

  validates :plan_id, presence: true
  validates :plan_detail_id, presence: true

end
