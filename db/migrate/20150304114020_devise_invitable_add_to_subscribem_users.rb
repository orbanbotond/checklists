class DeviseInvitableAddToSubscribemUsers < ActiveRecord::Migration
  def change
    add_column :subscribem_users, :invitation_token, :string
    add_column :subscribem_users, :invitation_created_at, :datetime
    add_column :subscribem_users, :invitation_sent_at, :datetime
    add_column :subscribem_users, :invitation_accepted_at, :datetime
    add_column :subscribem_users, :invitation_limit, :integer
    add_reference :subscribem_users, :invited_by, index: true, polymorphic: true

    add_index :subscribem_users, :invitation_token, :unique => true

    change_column :subscribem_users, :encrypted_password, :string, :null => true
  end
end
