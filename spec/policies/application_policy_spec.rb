require 'rails_helper'

describe 'ApplicationPolicy' do
  let(:user) { nil }
  let(:record) { nil }
  let(:policy) { ApplicationPolicy.new user, record }

  context 'index? action' do
    it 'authorizes' do
      expect(policy.index?).to be_truthy
    end
  end

  context 'show? action' do
    before do
      allow_any_instance_of(ApplicationPolicy).to receive(:scope).and_return(User.all)
    end
    context 'exists' do
      let(:record) { create :user }
      it 'allows' do
        expect(policy.show?).to be_truthy
      end
    end
    context 'does not exists' do
      let(:record) { build_stubbed :user }
      it 'denies' do
        expect(policy.show?).to be_falsey
      end
    end
  end

  context 'create? action' do
    it 'denies' do
      expect(policy.create?).to be_falsey
    end
  end

  context 'new? action' do
    it 'denies' do
      expect(policy).to receive(:create?).and_return(false)
      policy.new?
    end
  end

  context 'update? action' do
    it 'denies' do
      expect(policy.update?).to be_falsey
    end
  end

  context 'edit? action' do
    it 'denies' do
      expect(policy).to receive(:update?).and_return(false)
      policy.edit?
    end
  end

  context 'destroy? action' do
    it 'denies' do
      expect(policy.destroy?).to be_falsey
    end
  end
end
