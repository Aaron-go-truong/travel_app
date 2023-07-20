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
require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'associations' do
    it 'should belongs to user' do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end

    it 'can be belongs to comment' do
      like = FactoryBot.create(:like, :like_comment)
      expect(like.likeable_type).to eq('Comment')
    end

    it 'can be belongs to plan' do
      like = FactoryBot.create(:like, :like_plan)
      expect(like.likeable_type).to eq('Plan')
    end
  end
end
