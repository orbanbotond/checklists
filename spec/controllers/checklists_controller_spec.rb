require 'rails_helper'

RSpec.describe ChecklistsController do
  let(:account) { create :account }
  let(:user) { account.owner }

  before(:example) do
    sign_in(user)
  end

  context 'class hierarchy' do
    it { is_expected.to be_a(RestfullController)}
  end

  describe "GET new_checklist" do
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

  describe "POST create" do

    it "creates a checklist" do
      # post :create, checklist: {name: "Runway", tasks: [{value: false, description: 'First One'}, {value:true,description:'Second One'}]}
      # expect(response).to redirect_to(checklist_path(1))
    end
  end

  #   #
  #   it "creates a project (mock version)" do
  #     fake_action = instance_double(CreatesProject, create: true)
  #     expect(CreatesProject).to receive(:new)
  #         .with(name: "Runway", task_string: "Start something:2", users: [user])
  #         .and_return(fake_action)
  #     post :create, project: {name: "Runway", tasks: "Start something:2"}
  #     expect(response).to redirect_to(projects_path)
  #     expect(assigns(:action)).not_to be_nil
  #   end
  #   #

  #   #
  #   it "goes back to the form on failure" do
  #     post :create, project: {name: "", tasks: ""} 
  #     expect(response).to render_template(:new)
  #     expect(assigns(:project)).to be_present
  #   end
  #   #

  #   #
  #   it "fails create gracefully" do
  #     action_stub = double(create: false, project: Project.new) 
  #     expect(CreatesProject).to receive(:new).and_return(action_stub) 
  #     post :create, :project => {name: 'Project Runway'} 
  #     expect(response).to render_template(:new) 
  #   end
  #   #

  # end

  # #
  # describe "PATCH update" do
  #   it "fails update gracefully" do
  #     sample = Project.create!(name: "Test Project")
  #     expect(sample).to receive(:update_attributes).and_return(false) 
  #     allow(Project).to receive(:find).and_return(sample) 
  #     patch :update, id: sample.id, project: {name: "Fred"} 
  #     expect(response).to render_template(:edit) 
  #   end

  #   #
  #   it "does not allow user to make a project public if it is not theirs" do
  #     sample = Project.create!(name: "Test Project", public: false)
  #     patch :update, id: sample.id, project: {public: true}
  #     expect(sample.reload.public).to be_falsy
  #   end
  #   #
  # end
  # #

  # #
  # describe "GET show" do
  #   let(:project) { Project.create(name: "Project Runway") }

  #   it "allows a user who is part of the project to see the project" do
  #     allow(controller.current_user).to receive(:can_view?).and_return(true)
  #     get :show, id: project.id
  #     expect(response).to render_template(:show)
  #   end

  #   it "does not allow a user who is not part of the project to see the project" do
  #     allow(controller.current_user).to receive(:can_view?).and_return(false)
  #     get :show, id: project.id
  #     expect(response).to redirect_to(new_user_session_path)
  #   end
  # end
  # #

  # #
  # describe "GET index" do
  #   it "displays all projects correctly" do
  #     user = User.new
  #     project = Project.new(:name => "Project Greenlight")
  #     expect(controller).to receive(:current_user).and_return(user)
  #     expect(user).to receive(:visible_projects).and_return([project])
  #     get :index
  #     assert_equal assigns[:projects].map(&:__getobj__), [project]
  #   end
  # end
  # #

end
