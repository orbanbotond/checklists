require 'rails_helper'

RSpec.describe RecipesController do
  let(:account) { create :account }
  let(:user) { account.owner }
  let(:header_with_subdomain) { { 'HTTP_HOST' => "#{account.subdomain}.test.com"} }

  before(:example) do
    sign_in(user)
    allow_any_instance_of(ApplicationController).to receive(:current_account).and_return(account)
  end

  context 'class hierarchy' do
    it { is_expected.to be_a(RestfullController)}
  end

  describe "GET index" do
    let!(:recipe) { create :recipe, account: account}
    let!(:recipe_2) { create :recipe, account: account, name: 'jeiijj'}
    let(:checklist1) { create :checklist, recipe: recipe}
    let(:checklist2) { create :checklist, recipe: recipe}

    context 'without search' do
      it "renders the index" do
        get :index, {} , header_with_subdomain
        expect(response).to render_template(:index)
      end

      it "has 2 recipes" do
        get :index, {} , header_with_subdomain
        expect(assigns[:recipes].count).to eq(2)
      end
    end

    context 'with search' do
      let(:params) { {quick_search: { search_term: recipe_2.name } } }
      it "renders the index" do
        get :index, params , header_with_subdomain
        expect(response).to render_template(:index)
      end

      it "has 1 recipes" do
        get :index, params , header_with_subdomain
        expect(assigns[:recipes].count).to eq(1)
      end
    end

    #TODO later maybe add audit broadcast
  end

end
