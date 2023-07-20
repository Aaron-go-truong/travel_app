# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  address                :string
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  date_of_birth          :datetime
#  deactivated            :boolean          default(FALSE), not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  gender                 :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  unconfirmed_email      :string
#  user_name              :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create(:user) }

  describe 'associations' do
    it 'should have many plans' do
      assc = described_class.reflect_on_association(:plans)
      expect(assc.macro).to eq :has_many
    end

    it 'has many followers through passive_relationships' do
      assc = described_class.reflect_on_association(:followers)
      expect(assc.macro).to eq :has_many
    end

    it 'is following many other users through active_relationships' do
      assc = described_class.reflect_on_association(:following)
      expect(assc.macro).to eq :has_many
    end

    it 'has many comments through plans' do
      assc = described_class.reflect_on_association(:comments)
      expect(assc.macro).to eq :has_many
    end

    it 'has many notifications' do
      assc = described_class.reflect_on_association(:notifications)
      expect(assc.macro).to eq :has_many
    end
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'is not valid without a password' do
      user.password = nil
      expect(user).to_not be_valid
    end

    it 'is not valid without an email' do
      user.email = nil
      expect(user).to_not be_valid
    end
  end

  describe 'methods' do
    it 'returns true for active users' do
      expect(user.active_for_authentication?).to be true
    end

    it 'returns false for deactivated users' do
      user.deactivated = true
      expect(user.active_for_authentication?).to be false
    end

    it 'add user to following list when follow' do
      user1 = create(:user)
      user2 = create(:user)
      user1.follow(user2)
      expect(user1.following).to include(user2)
    end

    it 'remove user from following list when unfollow' do
      user1 = create(:user)
      user2 = create(:user)
      user1.active_relationships.create(followed_id: user2.id)
      user1.unfollow(user2)
      expect(user1.following).not_to include(user2)
    end
  end

  describe 'scopes' do
    it '.user_active' do
      other_user = create(:user, deactivated: true)
      users = User.where(id: [user, other_user])
      expect(users.user_active).to eq([user])
    end
  end
end
