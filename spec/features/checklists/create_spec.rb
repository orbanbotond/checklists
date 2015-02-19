require "rails_helper"

feature 'Create a Checklist' do
  extend SubdomainHelpers

  let(:account) { create :account }

  within_account_subdomain do
  end

  within_account_subdomain do
    scenario 'Create the checklist' do
      # sign_in_account account
      # click_on 'Create Checklist'
      # fill_in 'checklist_name', :with => 'Waiting Guests'
      # fill_in 'checklist_tasks_attributes_0_description', :with => 'Preparing Sushi'
      # click_on 'Create Checklist'
      # expect(page).to have_text("Your checklists")
      # #TODO change this to have_link
      # expect(page).to have_text("Waiting Guests")
    end
  end
end
