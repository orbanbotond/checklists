class RecipePolicy < ApplicationPolicy
  attr_reader :user, :record

  def index?
    if record.is_a? ActiveRecord::Relation
      true
    else
      record.account.users.include? user
    end
  end
end
