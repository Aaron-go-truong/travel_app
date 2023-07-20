# == Schema Information
#
# Table name: plans
#
#  id             :bigint           not null, primary key
#  activities     :text
#  address        :string           not null
#  amount         :integer          not null
#  deactivated    :boolean          default(FALSE), not null
#  descriptions   :text
#  likes_count    :integer          default(0), not null
#  notes          :text
#  plan_audience  :integer          default("Public"), not null
#  time           :string           not null
#  title          :string           not null
#  vehicles       :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  plan_parent_id :bigint
#  user_id        :bigint           not null
#
# Indexes
#
#  index_plans_on_plan_parent_id          (plan_parent_id)
#  index_plans_on_user_id                 (user_id)
#  index_plans_on_user_id_and_created_at  (user_id,created_at)
#
# Foreign Keys
#
#  fk_rails_...  (plan_parent_id => plans.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Plan, type: :model do
  plan = FactoryBot.create(:plan)

  describe 'associations' do
    it 'should have many comments' do
      assc = described_class.reflect_on_association(:comments)
      expect(assc.macro).to eq :has_many
    end

    it 'has many likes as likeable' do
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
    context 'plan_parent?' do
      it 'returns true for plan_parent' do
        expect(plan.plan_parent?).to be true
      end

      it 'returns false for plan have plan parent' do
        plan.plan_parent_id = Plan.first.id
        expect(plan.plan_parent?).to be false
      end
    end

    context 'include_plan?' do
      it 'returns true if the plan include other plan' do
        other_plan = create(:plan, plan_parent_id: plan.id)
        expect(plan.include_plan?(other_plan)).to be true
      end

      it 'returns false if the plan not include other plan' do
        other_plan = create(:plan)
        expect(plan.include_plan?(other_plan)).to be false
      end
    end
  end

  describe 'scopes' do
    let!(:user1) { create(:user, user_name: 'aluca') }
    let!(:user2) { create(:user, user_name: 'drax') }
    let!(:plan1) { create(:plan, title: 'BMT Travel', user_id: user1.id) }
    let!(:plan2) { create(:plan, title: 'Vung Tau Travel', user_id: user2.id) }

    context 'filter' do
      it '.filter_by_title' do
        plans = Plan.where(id: [plan1, plan2])
        result = plans.filter_by_title('BMT')
        expect(result).to eq([plan1])
      end

      it '.filter_by_username' do
        plans = Plan.where(id: [plan1, plan2])
        result = plans.filter_by_username('aluca')
        expect(result).to eq([plan1])
      end

      it '.filter_by_status' do
        plan1.update(plan_audience: 'Only')
        plan2.update(plan_audience: 'Public')
        plan1.reload
        plan2.reload
        plans = Plan.where(id: [plan1, plan2])
        result = plans.filter_by_status('Only')
        expect(result).to eq([plan1])
      end
    end

    context 'sort' do
      it '.sort_most_recent' do
        plans = Plan.where(id: [plan1, plan2])
        result = plans.sort_most_recent
        expect(result).to eq(plans.order(created_at: :desc))
      end

      it '.sort_oldest' do
        plans = Plan.where(id: [plan1, plan2])
        result = plans.sort_oldest
        expect(result).to eq(plans.order(created_at: :asc))
      end

      it '.sort_most_like' do
        user1.likes.create(likeable_id: plan2.id, likeable_type: 'Plan')
        plans = Plan.where(id: [plan1, plan2])
        result = plans.sort_most_like
        expect(result).to eq([plan2, plan1])
      end
    end

    it '.favourite_plans' do
      user1.likes.create(likeable_id: plan2.id, likeable_type: 'Plan')
      plans = Plan.where(id: [plan1, plan2])
      result = plans.favourite_plans(user1.id)
      expect(result).to eq([plan2])
    end

    it '.plan_active' do
      plan1.update(deactivated: true)
      plan1.reload
      plans = Plan.where(id: [plan1, plan2])
      result = plans.plan_active
      expect(result).to eq([plan2])
    end
  end
end
