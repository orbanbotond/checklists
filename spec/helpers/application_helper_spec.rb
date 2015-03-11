require 'rails_helper'

describe 'ApplicationHelper' do

  class A
    include ApplicationHelper

    def current_account
    end

  end

  context 'alert_class' do
    let(:a) { A.new }
    specify { expect(a.alert_class(:success)).to eq('alert-success') }
    specify { expect(a.alert_class(:notice)).to eq('alert-success') }
    specify { expect(a.alert_class(:alert)).to eq('alert-warning') }
    specify { expect(a.alert_class(:error)).to eq('alert-danger') }
  end

  context 'has_recipes?' do
    let(:account) { create :account }
    let(:recipe) { create :recipe }
    context "with recipes" do
      let(:a) { instance = A.new; allow(instance).to receive(:current_account).and_return(recipe.account); instance }
      specify {expect(a.has_recipes?).to be_truthy}
    end
    context "without recipes" do
      let(:a) { instance = A.new; allow(instance).to receive(:current_account).and_return(account);instance }
      specify {expect(a.has_recipes?).to be_falsy}
    end
  end

end
