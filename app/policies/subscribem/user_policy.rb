module Subscribem
  class UserPolicy
    attr_reader :account, :record

    def initialize(account, record)
      @account = account
      @record = record
    end

    def destroy?
      !record.has_role? :admin, account
    end
  end
end
