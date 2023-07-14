FactoryBot.define do
  factory :comment do
    content { Faker::Verb.base }

    association :user
    association :plan
  end
end
