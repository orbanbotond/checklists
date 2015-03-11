class SubscribemAccountsController < ApplicationController
  include DisplayCase::ExhibitsHelper
  include Pundit

  before_action :authenticate_user!

  def edit
    @users = exhibit(current_account.users)
    @account = current_account
    @invitation = InvitationForm.new
  end

protected

  def pundit_user
    current_account
  end

end