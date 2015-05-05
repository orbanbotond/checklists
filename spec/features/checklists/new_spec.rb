require 'rails_helper'

feature 'Listing checklists' do
  extend SubdomainHelpers

  within_account_subdomain do
    context 'create a checklist based on a recipe' do
      let(:account) { create :account }
      let(:another_account) { create :account }
      let(:recipe) { create :recipe, account: account }
      let!(:task_1) { create :task, checkable: recipe, value: true }
      let!(:task_2) { create :task, checkable: recipe, value: false }

      scenario 'Have all the tasks and name as defined in the recipe' do
      end
    end
  end
end
