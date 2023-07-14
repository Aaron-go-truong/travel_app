FactoryBot.define do
  factory :like do
    association :user
    association :likeable, factory: :comment
    association :likeable, factory: :plan
    created_at { DateTime.now }
    updated_at { DateTime.now }
  end
end
