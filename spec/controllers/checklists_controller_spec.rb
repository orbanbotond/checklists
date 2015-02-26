require 'rails_helper'

RSpec.describe ChecklistsController do
  let(:account) { create :account }
  let(:user) { account.owner }
  let(:recipe) { create :recipe, account: account}
  let!(:task_1) { create :task, checkable: recipe, value: false }
  let!(:task_2) { create :task, checkable: recipe, value: false }
  let!(:checklist) { create :checklist, recipe: recipe}
  let(:header_with_subdomain) { { 'HTTP_HOST' => "#{account.subdomain}.test.com"} }

  before(:example) do
    sign_in(user)
    allow_any_instance_of(ApplicationController).to receive(:current_account).and_return(account)
  end

  context 'class hierarchy' do
    it { is_expected.to be_a(RestfullController)}
  end

  describe "GET new_checklist" do
    context "For a Brand New Checklist" do
      it 'renders the new template' do
        get :new
        expect(response).to render_template(:new)
      end
      it 'it assigns the checklist' do
        get :new
        expect(assigns(:checklist)).to be_present
      end
      it 'it has an empty task' do
        get :new
        expect(assigns(:checklist).tasks.size).to eq 1
      end
    end
    context "For a Recipe Based Checklist" do
      it 'renders the new template' do
        get :new, {recipe_id: recipe.id}
        expect(response).to render_template(:new)
      end
      it 'assigns the checklist' do
        get :new, {recipe_id: recipe.id}
        expect(assigns(:checklist).name).to eq(recipe.name)
      end
      it 'has the same tasks as the recipe' do
        get :new, {recipe_id: recipe.id}
        expect(assigns(:checklist).tasks.size).to eq(recipe.tasks.size)
        expect(assigns(:checklist).tasks.map(&:description)).to eq(recipe.tasks.map(&:description))
      end
    end
  end

  describe "GET :index" do
    it 'renders the template' do
      get :index, {recipe_id: recipe.id}
      expect(response).to render_template(:index)
    end
    it 'it assigns the collection' do
      get :index, {recipe_id: recipe.id}
      expect(assigns(:checklists)).to be_present
    end
    it 'it assigns the recipe' do
      get :index, {recipe_id: recipe.id}
      expect(assigns(:recipe)).to be_present
    end
  end

  describe "POST create" do
    let(:params) { {checklist: {name: "Runway", tasks_attributes: [{value: false, description: 'First One'}, {value:true,description:'Second One'}]} }}
    it "renders the index" do
      post :create, params , header_with_subdomain
      expect(response).to redirect_to(recipe_checklists_path(Recipe.last))
    end
    it "creates a checklist" do
      expect do
        post :create, params, header_with_subdomain
      end.to change{Checklist.count}.by(1)
      expect(Checklist.last.account).to eq(account)
    end
    it "creates the tasks" do
      expect do
        post :create, params, header_with_subdomain
      end.to change{Task.count}
    end
    it "broadcasts the :create_checklist event" do
      expect do
        post :create, params, header_with_subdomain
      end.to broadcast(:update_checklist)
    end
  end

end
