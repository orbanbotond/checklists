require 'rails_helper'

describe Rock do

  context 'hierarchy' do
    specify { expect(subject.class).to be < ActiveRecord::Base }
  end

  context 'assotiations' do
    specify { expect(subject).to belong_to(:field) }
  end

  context 'states' do
    context 'consistency' do
      context '#solidifies' do
      end
      context '#fuses' do
      end
    end
  end

  context 'methods' do
    context 'instance' do
      context '#solid?' do
      end
      context '#color' do
      end
    end
    context 'singleton' do
      context '.create' do
      end
    end
  end

  context 'indexing' do
    # ...
  end
end
