require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe 'associations' do
    it "should belongs to recipient" do
      assc = described_class.reflect_on_association(:recipient)
      expect(assc.macro).to eq :belongs_to
    end
  end

  describe 'gem integration' do
    it 'includes the Noticed::Model module' do
      expect(Notification.ancestors).to include(Noticed::Model)
    end
  end
end
