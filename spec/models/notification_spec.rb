# == Schema Information
#
# Table name: notifications
#
#  id             :bigint           not null, primary key
#  params         :jsonb
#  read_at        :datetime
#  recipient_type :string           not null
#  type           :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  recipient_id   :bigint           not null
#
# Indexes
#
#  index_notifications_on_read_at    (read_at)
#  index_notifications_on_recipient  (recipient_type,recipient_id)
#
require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe 'associations' do
    it 'should belongs to recipient' do
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
