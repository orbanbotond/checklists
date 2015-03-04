class User < ActiveRecord::Base
  include Subscribem::UserStorage
  rolify role_join_table_name: 'subscribem_users_roles'
end
