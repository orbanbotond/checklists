class SubscribemAccountsController < ApplicationController
  include DisplayCase::ExhibitsHelper

  before_action :authenticate_user!

  def edit
    @users = exhibit(current_account.users)
    @account = current_account
    @invitation = InvitationForm.new
  end

  def update
    
  end
end