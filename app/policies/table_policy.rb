class TablePolicy < ApplicationPolicy
  # class Scope < Scope
  #   def resolve
  #     scope.all
  #   end
  # end

  def index?
    user.role == "manager" && record.restaurant == user.restaurant
  end

  def create?
    index?
  end

  def show?
    record.restaurant == user.restaurant
  end

  def destroy?
    index?
  end
end
