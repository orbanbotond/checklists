require 'rails_helper'

describe Task do
  context 'fields' do
    it { is_expected.to respond_to(:description) }
    it { is_expected.to respond_to(:value) }
  end
  context 'assotiations' do
    it { is_expected.to belong_to(:checkable) }
  end
  context 'validations' do
    it { is_expected.to validate_presence_of(:description) }
  end
  context 'index' do
    let(:recipe) { create :recipe }
    let(:task) { create :task, checkable: recipe }
    context 'update' do
      specify { expect { task.save! }.to update_index(SearchIndex::Recipe) }
    end
  end
end
