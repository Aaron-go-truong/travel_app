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
  after_destroy_commit :sub_likes_count

  private

  def broadcast_notifications
    add_likes_count
    if likeable_type == 'Plan'
      broadcast if user.id != Plan.find(likeable_id).user_id
    elsif user.id != Comment.find(likeable_id).user_id
      broadcast
    end
  end

  def sub_likes_count
    if likeable_type == 'Plan'
      @plan = Plan.find(likeable_id)
      @plan.likes_count -= 1
      @plan.save
    end
  end

  def add_likes_count
    if likeable_type == 'Plan'
      @plan = Plan.find(likeable_id)
      @plan.likes_count += 1
      @plan.save
    end
  end

  def broadcast
    LikeNotification.with(
      like: self,
      user: user,
      plan: likeable_type == 'Plan' ? likeable : Plan.find(likeable.plan_id)
    ).deliver_later(likeable.user)
  end
end
