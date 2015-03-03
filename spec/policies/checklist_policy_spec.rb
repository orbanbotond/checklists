require 'spec_helper'

describe 'ChecklistPolicy' do

  let(:user) { checklist.recipe.account.owner }
  let(:checklist) { build_stubbed :checklist }
  let(:policy) { ChecklistPolicy.new user, record }

  context 'create? action' do
    let(:record) do
      checklist
    end
    it 'authorizes' do
      expect(policy.create?).to be_truthy
    end
  end

  context 'update? action' do
    context 'the owner is the current_user' do
      let(:record) do
        puts checklist.recipe.account.users
        checklist
      end
      it 'authorizes' do
        expect(policy.update?).to be_truthy
      end
    end
    context 'the recipes owner is another user' do
      let(:user) { build_stubbed :user }
      let(:record) do
        checklist
      end
      it 'authorizes' do
        expect(policy.update?).to be_falsy
      end
    end
  end

  context 'show? action' do
    context 'the owner is the current_user' do
      let(:record) do
        puts checklist.recipe.account.users
        checklist
      end
      it 'authorizes' do
        expect(policy.show?).to be_truthy
      end
    end
    context 'the recipes owner is another user' do
      let(:user) { build_stubbed :user }
      let(:record) do
        checklist
      end
      it 'authorizes' do
        expect(policy.show?).to be_falsy
      end
    end
  end

end
