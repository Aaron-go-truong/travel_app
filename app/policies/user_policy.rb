class UserPolicy < ApplicationPolicy
  def update?
    user.has_role?(:admin) || user.id == record.user_id
  end

  def edit?
    user.has_role?(:admin) || user.id == record.user_id
  end

  def destroy?
    user.has_role?(:admin) || user.id == record.user_id
  end

  def unfollow?
    user.has_role?(:admin) || user.following?(record)
  end
end
