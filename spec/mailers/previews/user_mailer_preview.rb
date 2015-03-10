# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def added_to_account
    UserMailer.added_to_account(Subscribem::User.first, Subscribem::Account.first)
  end
end
