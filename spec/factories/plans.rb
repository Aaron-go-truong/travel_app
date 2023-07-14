FactoryBot.define do
  factory :plan do
    association :user
    association :plan_parent, factory: :plan
    title { Faker::Nation.capital_city }
    descriptions { Faker::Marketing.buzzwords }
    amount {Faker::Number.number(digits: 8)}
    time {Faker::Number.number(digits: 2)}
    address { Faker::Address.street_address }
    plan_audience { Plan.plan_audience.values.sample }
    created_at { DateTime.now }
    updated_at { DateTime.now }
  end
end
