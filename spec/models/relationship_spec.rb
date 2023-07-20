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
require 'rails_helper'

RSpec.describe Relationship, type: :model do
  describe 'associations' do
    it 'should belongs to follower' do
      assc = described_class.reflect_on_association(:follower)
      expect(assc.macro).to eq :belongs_to
    end

    it 'should belongs to followed' do
      assc = described_class.reflect_on_association(:followed)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
