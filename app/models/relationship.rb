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
class Relationship < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'

  validates :follower_id, presence: true
  validates :followed_id, presence: true

  validates_uniqueness_of :follower_id, scope: [:followed_id]

  has_noticed_notifications model_name: 'Notification'
  after_create_commit :broadcast_notifications

  private

  def broadcast_notifications
    FollowNotification.with(
      relationship: self,
      user: follower
    ).deliver_later(followed)
  end
end
