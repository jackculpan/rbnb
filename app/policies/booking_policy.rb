class BookingPolicy < ApplicationPolicy
  # class Scope < Scope
  #   def resolve
  #     scope.where(user: user)
  #   end
  # end

  def dashboard?
    true
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    is_user_or_admin?
  end

  def update?
    is_user_or_admin?
  end

  def destroy?
    is_user_or_admin?
  end

  private

  def is_user_or_admin?
    record.user == user || user.admin
  end
end
