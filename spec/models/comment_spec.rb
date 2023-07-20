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
require 'rails_helper'

RSpec.describe Comment, type: :model do
  comment = FactoryBot.create(:comment)

  describe 'associations' do
    it 'should have many replies' do
      assc = described_class.reflect_on_association(:replies)
      expect(assc.macro).to eq :has_many
    end

    it 'has many like as likeable' do
      assc = described_class.reflect_on_association(:likes)
      expect(assc.macro).to eq :has_many
    end
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(comment).to be_valid
    end

    it 'is not valid without content' do
      comment.content = nil
      expect(comment).to_not be_valid
    end
  end

  describe 'scopes' do
    it '.comment_parent' do
      result = described_class.comment_parent
      expect(result).to eq(described_class.where(cmt_parent_id: nil))
    end
  end
end
