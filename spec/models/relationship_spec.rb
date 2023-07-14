require 'rails_helper'

RSpec.describe Relationship, type: :model do
  user = FactoryBot.create(:user)

  describe 'associations' do
    it "should belongs to follower" do
      assc = described_class.reflect_on_association(:follower)
      expect(assc.macro).to eq :belongs_to
    end

    it "should belongs to followed" do
      assc = described_class.reflect_on_association(:followed)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
