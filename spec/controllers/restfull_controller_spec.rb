require 'rails_helper'

describe RestfullController do
  context 'class' do
    context 'hierarchy' do
      specify { expect(subject).to be_kind_of(InheritedResourcesWithPundit) }
    end

    context 'macros' do
      context 'filters' do
        specify { expect(subject.class).to filter(:after, with: :verify_authorized) }
      end
    end
  end
end
