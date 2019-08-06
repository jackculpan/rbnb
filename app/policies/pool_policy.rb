class PoolPolicy < ApplicationPolicy
  #class Scope < Scope
   # def resolve
   #   scope.all
   # end
  #end

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
    true
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
