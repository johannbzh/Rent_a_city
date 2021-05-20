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
    my_booked_cities = []
    user.bookings.each do |booking|
      my_booked_cities << booking.city
    end
    my_booked_cities.include?(record)
  end
end
