FactoryBot.define do
  factory :comment do
    association :user
    association :plan
    association :cmt_parent, factory: :comment
    content { Faker::Verb.base }
    created_at { DateTime.now }
    updated_at { DateTime.now }
  end
end
