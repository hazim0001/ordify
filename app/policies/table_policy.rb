class TablePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user.restaurant == record.first.restaurant
  end

  def create?
    user.role == "manager" && record.restaurant == user.restaurant
  end

  def show?
    record.restaurant == user.restaurant
  end

  def destroy?
    user.role == "manager" && record.restaurant == user.restaurant
  end
end
