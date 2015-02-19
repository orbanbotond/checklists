require "rails_helper"

feature 'Create a Checklist' do
  extend SubdomainHelpers

  let(:account) { create :account }

  within_account_subdomain do
    context "The account brand new" do
      scenario "Shows the empty page" do
        sign_in_account account
        expect(page).to have_text("It looks like you don't have any checklists yet")
        expect(page).to have_text("Create Checklist")
      end    
    end
  end

  within_account_subdomain do
    context 'The account already has some checklists' do
      let!(:checklist) { create :checklist }
      scenario "The account is empty" do
        sign_in_account account
        expect(page).to have_text("Your checklists")
        expect(page).to have_link("#{checklist.name}")
      end    
    end
  end
end
