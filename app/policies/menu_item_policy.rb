class MenuItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    user.role == "manager"
  end

  def create?
    new?
  end

  def update?
    record.restaurant == user.restaurant && user.role == "manager"
  end

  def edit?
    update?
  end

  def destroy?
    edit
  end
end
