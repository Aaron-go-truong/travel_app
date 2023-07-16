FactoryBot.define do
  factory :like do
    association :user
  end

  trait :like_comment do
    association :likeable, factory: :comment
  end

  trait :like_plan do
    association :likeable, factory: :plan
  end
end
