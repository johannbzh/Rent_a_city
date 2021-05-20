class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def create?
      record.booking.user == user
    end

    def update?
      record.booking.user == user
    end

    def destroy?
      record.booking.user == user
    end


  end
end
