FactoryBot.define do
  factory :relationship do
    association :follower, factory: :user
    association :followed, factory: :user
    created_at { DateTime.now }
    updated_at { DateTime.now }
  end
end
