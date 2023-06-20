# == Schema Information
#
# Table name: plans
#
#  id             :bigint           not null, primary key
#  activities     :text
#  address        :string           not null
#  amount         :integer          not null
#  descriptions   :text
#  notes          :text
#  plan_audience  :integer          default("Public"), not null
#  time           :string           not null
#  title          :string           not null
#  vehicles       :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  plan_parent_id :bigint
#  user_id        :bigint           not null
#
# Indexes
#
#  index_plans_on_plan_parent_id          (plan_parent_id)
#  index_plans_on_user_id                 (user_id)
#  index_plans_on_user_id_and_created_at  (user_id,created_at)
#
# Foreign Keys
#
#  fk_rails_...  (plan_parent_id => plans.id)
#  fk_rails_...  (user_id => users.id)
#
class Plan < ApplicationRecord
  enum plan_audience: %i[Public Followers Only]

  has_one_attached :image_description

  has_many :plan_details, class_name: 'Plan', foreign_key: :plan_parent_id, dependent: :destroy
  accepts_nested_attributes_for :plan_details, allow_destroy: true

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  belongs_to :plan_parent, class_name: 'Plan', optional: true
  belongs_to :user

  validates_numericality_of :amount

  scope :plan_parent, -> { where plan_parent_id: nil }

  def include_plan?(other_plan)
    plan_details.include?(other_plan)
  end

  def plan_parent?
    plan_parent_id.nil?
  end
end
