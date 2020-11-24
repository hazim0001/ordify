class LineItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def destroy?
    # raise
    if record.sent == true
      user.role == "manager"
    else
      true
    end
  end
end
