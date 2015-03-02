require 'rails_helper'

describe Checklist do
  context 'fields' do
    it { is_expected.to respond_to(:name) }
  end
  context 'assotiations' do
    it { is_expected.to have_many(:tasks).dependent(:destroy) }
    it { is_expected.to belong_to(:recipe) }
  end
  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
