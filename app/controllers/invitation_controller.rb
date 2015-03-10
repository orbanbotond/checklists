class InvitationController < ApplicationController

  before_action :authenticate_user!

  def create
    form = InvitationForm.new params[:invitation_form]
    if form.valid?
      user = Subscribem::User.find_by_email( form.email) || Subscribem::User.invite!( email: form.email)
      current_account.users << user
      mail = UserMailer.added_to_account user, current_account
      mail.deliver
      redirect_to edit_subscribem_account_path(current_account), notice: 'The invitation is send and the user is added to the account'
    else
      redirect_to edit_subscribem_account_path(current_account), alert: 'The email must be a valid email'
    end
  end

end
