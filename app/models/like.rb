# == Schema Information
#
# Table name: likes
#
#  id            :bigint           not null, primary key
#  likeable_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  likeable_id   :bigint
#  user_id       :bigint           not null
#
# Indexes
#
#  index_likes_on_likeable  (likeable_type,likeable_id)
#  index_likes_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Like < ApplicationRecord
  belongs_to :likeable, polymorphic: true
  belongs_to :user

  has_noticed_notifications model_name: 'Notification'
  after_create_commit :broadcast_notifications

  private

  def broadcast_notifications
    LikeNotification.with(
      like: self,
      user: user,
      plan: likeable_type == 'Plan' ? likeable : Plan.find(likeable.plan_id)
    ).deliver_later(likeable.user)
  end
end
