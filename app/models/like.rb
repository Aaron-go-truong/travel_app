# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  comment_id :bigint
#  plan_id    :bigint
#  user_id    :bigint           not null
#
# Indexes
#
#  index_likes_on_comment_id  (comment_id)
#  index_likes_on_plan_id     (plan_id)
#  index_likes_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (comment_id => comments.id)
#  fk_rails_...  (plan_id => plans.id)
#  fk_rails_...  (user_id => users.id)
#
class Like < ApplicationRecord
  belongs_to :user
  belongs_to :comment, optional: true
  belongs_to :plan, optional: true


end
