require 'rails_helper'

RSpec.describe Plan, type: :model do

  plan = FactoryBot.create(:plan)

  describe 'associations' do
    it "should have many comments" do
      assc = described_class.reflect_on_association(:comments)
      expect(assc.macro).to eq :has_many
    end

    it "has many likes as likeable" do
      assc = described_class.reflect_on_association(:likes)
      expect(assc.macro).to eq :has_many
    end
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(plan).to be_valid
    end

    it 'is not valid without a title' do
      plan.title = nil
      expect(plan).to_not be_valid
    end

    it 'is not valid without amount' do
      plan.amount = nil
      expect(plan).to_not be_valid
    end

    it 'is not valid without address' do
      plan.address = nil
      expect(plan).to_not be_valid
    end

    it 'is not valid without time' do
      plan.time = nil
      expect(plan).to_not be_valid
    end
  end

  describe 'methods' do
    it 'returns true for plan_parent' do
      expect(plan.plan_parent?).to be true
    end
  end
end
