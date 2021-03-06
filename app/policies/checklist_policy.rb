class ChecklistPolicy < ApplicationPolicy
  attr_reader :user, :record

  def create?
    true
  end

  def update?
    record.recipe.account.users.include? user
  end

  def show?
    record.recipe.account.users.include? user
  end
end
