class ChecklistPolicy < ApplicationPolicy
  attr_reader :user, :record

#TODO make for all the other actions too

  def create?
    true
  end

  def update?
    true
  end

  def show?
    record.recipe.account.users.include? user
  end

end

