FactoryBot.define do
  factory :notification do
    association :recipient, factory: :user
    recipient_type { 'User' }
    type { ['LikeNotification', 'CommentNotification', 'PlanNotification', 'FollowNotification'].sample }
    params { {} }
    read_at { nil }
    created_at { DateTime.now }
    updated_at { DateTime.now }
  end
end
