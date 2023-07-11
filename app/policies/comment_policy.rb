class CommentPolicy < ApplicationPolicy
  def update?
    user.has_role?(:admin) || user.id == record.user_id
  end

  def edit?
    user.has_role?(:admin) || user.id == record.user_id
  end

  def destroy?
    user.has_role?(:admin) || user.id == record.user_id
  end
end
