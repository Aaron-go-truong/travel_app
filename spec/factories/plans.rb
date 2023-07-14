FactoryBot.define do
  factory :plan do
    title { Faker::Nation.capital_city }
    descriptions { Faker::Marketing.buzzwords }
    amount {Faker::Number.number(digits: 8)}
    time {Faker::Number.number(digits: 2)}
    address { Faker::Address.street_address }
    plan_audience { Plan.plan_audiences.values.sample }

    association :user
  end
end
