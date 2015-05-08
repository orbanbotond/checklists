require 'rails_helper'

describe Field do

  context 'hierarchy' do
    specify { expect(subject.class).to be < ActiveRecord::Base }
  end

  context 'assotiations' do
    specify { expect(subject).to have_many(:rocks) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

end
