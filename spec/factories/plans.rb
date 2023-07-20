# == Schema Information
#
# Table name: plans
#
#  id             :bigint           not null, primary key
#  activities     :text
#  address        :string           not null
#  amount         :integer          not null
#  deactivated    :boolean          default(FALSE), not null
#  descriptions   :text
#  likes_count    :integer          default(0), not null
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
FactoryBot.define do
  factory :plan do
    title { Faker::Nation.capital_city }
    descriptions { Faker::Marketing.buzzwords }
    amount { Faker::Number.number(digits: 8) }
    time { Faker::Number.number(digits: 2) }
    address { Faker::Address.street_address }
    plan_audience { Plan.plan_audiences.keys.sample }

    association :user
  end
end
