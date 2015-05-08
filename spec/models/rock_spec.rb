require 'rails_helper'

describe Rock do

  context 'hierarchy' do
    specify { expect(subject.class).to be < ActiveRecord::Base }
  end

  context 'assotiations' do
    specify { expect(subject).to belong_to(:field) }
  end

end
