class AddAdminRoleToOwner < ActiveRecord::Migration
  def change
    Subscribem::Account.find_each do |account|
      owner = account.owner
      owner.add_role :admin, account
    end
  end
end
