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
    let(:recipe) { create :recipe, account: account}
    let(:checklist1) { create :checklist, recipe: recipe}
    let(:checklist2) { create :checklist, recipe: recipe}

    it "renders the index" do
      get :index, {} , header_with_subdomain
      expect(response).to render_template(:index)
    end

    #TODO later maybe add audit broadcast
  end

end
