require "rails_helper"

feature 'Create a Checklist' do
  extend SubdomainHelpers

  let(:account) { create :account }
  let(:another_account) { create :account }

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
      let!(:checklist) { create :checklist, account: account }
      scenario "The account lists its checklists" do
        sign_in_account account
        expect(page).to have_text("Your checklists")
        expect(page).to have_link("#{checklist.name}")
      end
      let(:foreign_checklist) { create :checklist, account: another_account, name: 'Not There' }
      scenario "The account doesn't list the checklists belonging to another account" do
        foreign_checklist
        sign_in_account account
        expect(page).to_not have_link("#{foreign_checklist.name}")
      end    
    end
  end
end
