require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe ProjectsController, type: :controller do

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ProjectsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  let!(:valid_project) { FactoryGirl.create(:project_valid) }
  let(:valid_project_attr) { FactoryGirl.build(:project_valid).attributes.symbolize_keys }
  let(:invalid_project) { FactoryGirl.build(:project_no_name) }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}, session: valid_session
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "contains valid project" do
      get :index, params: {}, session: valid_session
      expect(assigns(:projects)).to include(valid_project)
    end

    it "does not contain invalid project" do
      get :index, params: {}, session: valid_session
      expect(assigns(:projects)).not_to include(invalid_project)
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: valid_project.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: {id: valid_project.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Project" do
        expect {
          post :create, params: { project: valid_project_attr }, session: valid_session
        }.to change(Project, :count).by(1)
      end

      it "redirects to the created project" do
        post :create, params: { project: valid_project_attr }, session: valid_session
        expect(response).to redirect_to(Project.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {project: invalid_project.attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: "This is a new name" }
      }

      it "updates the requested project" do
        put :update, params: {id: valid_project.to_param, project: new_attributes}, session: valid_session
        expect(valid_project.reload.name).to eq("This is a new name")
      end

      it "redirects to the project" do
        put :update, params: {id: valid_project.to_param, project: new_attributes}, session: valid_session
        expect(response).to redirect_to(valid_project)
      end
    end

    context "with invalid params" do
      let(:invalid_new_attributes) {
        { name: nil }
      }

      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: {id: valid_project.to_param, project: invalid_new_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested project" do
      expect {
        delete :destroy, params: {id: valid_project.to_param}, session: valid_session
      }.to change(Project, :count).by(-1)
    end

    it "redirects to the projects list" do
      delete :destroy, params: {id: valid_project.to_param}, session: valid_session
      expect(response).to redirect_to(projects_url)
    end
  end

end
