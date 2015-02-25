require 'rails_helper'

describe Recipe do
  context 'fields' do
    it { is_expected.to respond_to(:name) }
  end
  context 'assotiations' do
    it { is_expected.to have_many(:checklists) }
    it { is_expected.to have_many(:tasks) }
  end
  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
  context 'creates a checklist' do
    let(:task1) { create :task, checkable: recipe }
    let(:task2) { create :task, checkable: recipe }
    let(:recipe) do
      create :recipe
    end

    it 'has the factory method' do
      expect(recipe).to respond_to(:create_checklist)
    end
    it 'copies the name' do
      checklist = recipe.create_checklist
      expect(checklist.name).to eq(recipe.name)
    end
    it 'copies all the tasks' do
      checklist = recipe.create_checklist
      expect(checklist.tasks.count).to eq(recipe.tasks.count)
      expect(checklist.tasks.pluck(:description)).to eq(recipe.tasks.pluck(:description))
    end
  end
end