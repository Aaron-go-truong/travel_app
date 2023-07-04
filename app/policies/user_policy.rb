class UserPolicy < ApplicationPolicy
  def update_status?
    user.admin?
  end
end
