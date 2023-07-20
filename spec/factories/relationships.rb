# == Schema Information
#
# Table name: relationships
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  followed_id :integer
#  follower_id :integer
#
FactoryBot.define do
  factory :relationship do
    association :follower, factory: :user
    association :followed, factory: :user
    created_at { DateTime.now }
    updated_at { DateTime.now }
  end
end
