class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.city.user != user
  end

  def update?
    record.city.user != user
  end

  def destroy?
    record.city.user != user
  end

end

