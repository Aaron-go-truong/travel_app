FactoryBot.define do
  factory :notification do
    recipient_type { 'User' }
    type { ['LikeNotification', 'CommentNotification', 'PlanNotification', 'FollowNotification'].sample }
    params { {} }
    read_at { nil }

    association :recipient, factory: :user
  end
end
