class UserMailer < ApplicationMailer
  def added_to_account(user, account)
    @user = user
    @url  = "http://#{account.subdomain}.tochecklists.tk"
    @name  = account.name
    mail(from: 'noreply@tochecklists.tk', to: @user.email, subject: "You have been added to the account: #{account.name}")
  end
end
