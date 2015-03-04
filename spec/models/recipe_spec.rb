require 'rails_helper'

describe Recipe do
  context 'fields' do
    it { is_expected.to respond_to(:name) }
  end
  context 'assotiations' do
    it { is_expected.to have_many(:checklists).dependent(:destroy) }
    it { is_expected.to have_many(:tasks) }
    it { is_expected.to belong_to(:account) }
  end
  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
  context 'instantiates a checklist' do
    let(:task1) { create :task, checkable: recipe }
    let(:task2) { create :task, checkable: recipe }
    let(:recipe) do
      create :recipe
    end

    it 'has the factory method' do
      expect(recipe).to respond_to(:new_checklist)
    end
    it 'copies the name' do
      checklist = recipe.new_checklist
      expect(checklist.name).to eq(recipe.name)
    end
    it 'dont persist the checklist' do
      checklist = recipe.new_checklist
      expect(checklist.persisted?).to be_falsy
    end
    it 'set the recipe id' do
      checklist = recipe.new_checklist
      expect(checklist.recipe_id).to eq(recipe.id)
    end
    it 'copies all the tasks' do
      checklist = recipe.new_checklist
      expect(checklist.tasks.count).to eq(recipe.tasks.count)
      expect(checklist.tasks.map(&:description)).to eq(recipe.tasks.map(&:description))
    end
  end

  context "index" do
    let(:recipe) { create :recipe }
    context 'update' do
      specify { expect { recipe.save! }.to update_index(SearchIndex::Recipe) }
    end
  end
end