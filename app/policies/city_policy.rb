class CityPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def new?
    show?
  end

  def create?
    show?
  end

  def edit?
    record.user == user
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end

  def add_review?
    return false if Review.find_by(user: user, city: record)

    user.booked_cities.include?(record)
  end
end
