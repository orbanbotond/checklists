class User < ActiveRecord::Base
  include Subscribem::UserStorage
  rolify role_join_table_name: 'subscribem_users_roles'

  devise :invitable, :invite_for => 2.weeks

end
