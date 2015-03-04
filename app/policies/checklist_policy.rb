class ChecklistPolicy < ApplicationPolicy
  attr_reader :user, :record

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

# TODO add this as ability to share the checklist with others.
# u = User.first
# lcl = Checklist.last

# u.add_role :observer, lcl

# lcl.roles
# lcl.applied_roles

# Checklist.with_role(:observer)


