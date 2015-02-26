require "rails_helper"

feature 'Listing checklists' do
  extend SubdomainHelpers

  let!(:account) { create :account }
  let!(:other_account) { create :account }
  let!(:recipe) { create :recipe, name: 'Recipe 1', account: account }
  let!(:other_recipe) { create :recipe, name: 'Recipe 2', account: account }
  let!(:other_checklist) { create :recipe, account: other_account }
  let!(:checklist_1) { create :checklist, recipe: recipe, name: 'Making Sushi' }
  let!(:task_1_1) { create :task, checkable: checklist_1, value: true }
  let!(:task_1_2) { create :task, checkable: checklist_1, value: false }
  let!(:checklist_2) { create :checklist, recipe: recipe, name: 'Checking Staging Deployment' }
  let!(:task_2_1) { create :task, checkable: checklist_2, value: true }
  let!(:task_2_2) { create :task, checkable: checklist_2, value: true }
  let!(:task_2_3) { create :task, checkable: checklist_2, value: true }

  within_account_subdomain do
    scenario "Shows the checklist" do
      sign_in_account account
      click_on 'Applied 2 times'
      expect(page).to have_text("Checklists for #{recipe.name}")
      expect(page).to have_text("#{1} of #{checklist_1.tasks.count} pending")
      expect(page).to have_text("Complete")
    end

    scenario "Does not show the other recipes checklists" do
      sign_in_account account
      visit recipe_checklists_path(recipe)
      expect(page).not_to have_text(other_checklist.name)
    end
  end
end
