class LikePolicy < ApplicationPolicy
  def create?
    user.has_role?(:admin) || user.id == record.user_id
  end

  def destroy?
    user.has_role?(:admin) || user.id == record.user_id
  end
end
