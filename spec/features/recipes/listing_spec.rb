require "rails_helper"

feature 'Listing checklists' do
  extend SubdomainHelpers

  let(:account) { create :account }
  let(:another_account) { create :account }

  within_account_subdomain do
    context "the account is new" do
      scenario "Shows the empty page" do
        sign_in_account account
        expect(page).to have_text("It looks like you don't have any checklists yet")
        expect(page).to have_text("Create Checklist")
      end    
    end

    context 'the account already has some checklists' do
      context 'the accounts recipes are listed' do
        let!(:recipe) { create :recipe, account: account }
        let!(:checklist) { create :checklist, recipe: recipe }
        let!(:checklist2) { create :checklist, recipe: recipe }
        scenario "lists recipes" do
          sign_in_account account
          expect(page).to have_text("Your Recipes")
          expect(page).to have_link("#{checklist.recipe.name}")
        end
        scenario "lists recipes usages" do
          sign_in_account account
          expect(page).to have_text("Your Recipes")
          expect(page).to have_link("Applied #{checklist.recipe.checklists.count} times")
        end
      end
      context "the other accounts recipes are not present" do
        let!(:recipe) { create :recipe, account: another_account }
        let!(:foreign_checklist) { create :checklist, recipe: recipe, name: 'Not There' }
        scenario "The account doesn't list the checklists belonging to another account" do
          sign_in_account account
          expect(page).to_not have_link("#{foreign_checklist.recipe.name}")
        end
      end
    end
  end
end
