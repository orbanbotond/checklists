class UsersController < ApplicationController
  before_action :authenticate_user!

  def destroy
    user = Subscribem::User.find params[:id]
    current_account.users.delete user
    redirect_to edit_subscribem_account_path(current_account), success: 'The user has been removed from this account'
  end

end
