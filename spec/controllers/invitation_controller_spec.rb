require 'rails_helper'

RSpec.describe InvitationController do
  let(:params) { { invitation_form: { email: email } } }
  let!(:account) { create :account }
  before do
    allow(subject).to receive(:current_account).and_return(account)
    sign_in(account.owner)
  end
  context 'email field is populated' do
    let(:email) { 'orbanbotond@gmail.com' }
    context 'user exists' do
      let!(:user) { create :user, email: params[:invitation_form][:email] }
      it 'adds the user to the account' do
        post :create, params
        expect(account.reload.users).to include(user)
      end
      it 'sends a notification email' do
        post :create, params
        expect(ActionMailer::Base.deliveries.last.to).to include(user.email)
      end
      it 'doesnt create a new user' do
        expect do
          post :create, params
        end.to_not change { User.count }
      end
    end
    context 'user is created and invited' do
      it 'adds the user to the account' do
        expect do
          post :create, params
        end.to change { account.reload.users.count }.by(1)
      end
      it 'sends a notification email' do
        post :create, params
        expect(ActionMailer::Base.deliveries.last.to).to include(Subscribem::User.last.email)
      end
      it 'doesnt create a new user' do
        expect do
          post :create, params
        end.to change { User.count }.by(1)
      end
    end
  end
  context 'email is empty' do
    let(:email) { nil }
    before do
      ActionMailer::Base.deliveries.clear
    end
    it 'doesnt create a new user' do
      expect do
        post :create, params
      end.to_not change { User.count }
    end
    it 'doesnt send a notification email' do
      post :create, params
      expect(ActionMailer::Base.deliveries).to be_empty
    end
  end
end
