class GatewayPolicy < ApplicationPolicy
  def admin_namespace?
    user.has_role?(:admin)
  end
end
