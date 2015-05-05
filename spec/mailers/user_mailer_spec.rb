require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'added_to_account' do
    let(:user) { account.owner }
    let(:account) { create :account }
    let(:mail) { UserMailer.added_to_account(user, account) }

    it 'renders the subject' do
      expect(mail.subject).to match('You have been added to the account')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql([user.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['noreply@tochecklists.tk'])
    end

    it 'body' do
      expect(mail.body).to match('Congratulations!')
      expect(mail.body).to match('You have been added to the')
      expect(mail.body).to match('Please visit your organization site')
      expect(mail.body).to match("http://#{account.subdomain}.tochecklists.tk")
    end
  end
end
