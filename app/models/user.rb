class User < ActiveRecord::Base
  include Subscribem::UserStorage

  devise :invitable, invite_for: 2.weeks
end
