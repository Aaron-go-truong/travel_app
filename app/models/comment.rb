# == Schema Information
#
# Table name: comments
#
#  id            :bigint           not null, primary key
#  content       :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  cmt_parent_id :bigint
#  plan_id       :bigint           not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_comments_on_cmt_parent_id  (cmt_parent_id)
#  index_comments_on_plan_id        (plan_id)
#  index_comments_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (cmt_parent_id => comments.id)
#  fk_rails_...  (plan_id => plans.id)
#  fk_rails_...  (user_id => users.id)
#
class Comment < ApplicationRecord
  belongs_to :plan
  belongs_to :user
  belongs_to :cmt_parent, class_name: 'Comment', optional: true
  has_many :replies, class_name: 'Comment', foreign_key: :cmt_parent_id, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :content, presence: true
end