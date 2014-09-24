class RoleConstraint
  def initialize(*roles)
    @roles = roles
  end

  def matches?(request)
    @roles.include?(current_user)
  end
end