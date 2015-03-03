require 'spec_helper'

describe 'RecipePolicy' do

  let(:user) { recipe.account.owner }
  let(:recipe) { build_stubbed :recipe }
  let(:policy) { RecipePolicy.new user, record }

  context 'index? action' do
    context 'the record is an AR/Relation' do
      let(:record) do
        record = double('asd');
        allow(record).to receive(:is_a?).and_return(true)
        record
      end
      it 'authorizes' do
        expect(policy.index?).to be_truthy
      end
    end
    context 'the record is a recipe' do
      context 'the recipes owner is the current_user' do
        let(:record) do
          puts recipe.account.users
          recipe
        end
        it 'authorizes' do
          expect(policy.index?).to be_truthy
        end
      end
      context 'the recipes owner is another user' do
        let(:user) { build_stubbed :user }
        let(:record) do
          recipe
        end
        it 'authorizes' do
          expect(policy.index?).to be_falsy
        end
      end
    end
  end

end
