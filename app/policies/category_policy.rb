class CategoryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # def index?
  #   true
  #   # record.restaurant == user.restaurant && user.role == "manager"
  # end

  def create?
    user.role == "manager"
  end

  def destroy?
    record.menu_items.last.restaurant == user.restaurant && user.role == "manager"
  end
end
