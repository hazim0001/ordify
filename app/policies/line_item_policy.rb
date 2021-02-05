class LineItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def destroy?
    if record.ordered == true
      user.role == "manager"
    else
      true
    end
  end
end
