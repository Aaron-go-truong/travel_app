class NotificationPolicy < ApplicationPolicy
  def update?
    user.has_role?(:admin) || user.id == record.recipient_id
  end

  def mark_all_as_read?
    user.has_role?(:admin) || user.id == record.recipient_id
  end
end
