require 'rails_helper'
require 'factory_girl_rails'
include FactoryGirl

RSpec.describe RegisteredApplicationsController, type: :controller do
  let(:my_user) { create(:user) }
  let(:my_app) { create(:registered_application, user: my_user) }
  
  context "signed in user" do
    before do
      my_user 
      my_user.confirm
      sign_in my_user
    end
    
    describe "GET #index" do
      it "returns a success response" do
        get :index
        expect(response).to be_success
      end
    end
  
    describe "GET show" do
      it "returns http success" do
        get :show, params: {id: my_app.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the #show view" do
        get :show, params: {id: my_app.id}
        expect(response).to render_template :show
      end

      it "assigns my_app to @topic" do
        get :show, params: {id: my_app.id}
        expect(assigns(:registered_application)).to eq(my_app)
      end
    end
  
    describe "GET new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end

      it "renders the #new view" do
        get :new
        expect(response).to render_template :new
      end

      it "initializes @registered_application" do
        get :new
        expect(assigns(:registered_application)).not_to be_nil
      end
    end
  
    describe "GET edit" do
      it "returns http success" do
        get :edit, params: {id: my_app.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the #edit view" do
        get :edit, params: {id: my_app.id}
        expect(response).to render_template :edit
      end

      it "assigns topic to be updated to @registered_application" do
        get :edit, params: {id: my_app.id}
        app_instance = assigns(:registered_application)

        expect(app_instance.id).to eq my_app.id
        expect(app_instance.name).to eq my_app.name
        expect(app_instance.url).to eq my_app.url
      end
    end
  
    describe "POST create" do
      it "increases the number of registered_applictions by 1" do
        app_name = "app_1"
        app_url = "http://app_1.com"
        expect{ post :create, params: {registered_application: { name: app_name, url: app_url} } }.to change(RegisteredApplication,:count).by(1)
      end

      it "assigns RegisteredApplication.last to @registered_application" do
        app_name = "app_2"
        app_url = "http://app_2.com"
        post :create, params: {registered_application: { name: app_name, url: app_url} }
        expect(assigns(:registered_application)).to eq RegisteredApplication.last
      end

      it "redirects to the new topic" do
        app_name = "app_3"
        app_url = "http://app_3.com"
        post :create, params: {registered_application: { name: app_name, url: app_url} }
        expect(response).to redirect_to RegisteredApplication.last
      end
    end
  
    describe "PUT update" do
      it "updates registered_application with expected attributes" do
        new_name = "app_4"
        new_url = "http://app_4.com"

        put :update, params: { id: my_app.id, registered_application: {name: new_name, url: new_url}}

        updated_app = assigns(:registered_application)
        expect(updated_app.id).to eq my_app.id
        expect(updated_app.name).to eq new_name
        expect(updated_app.url).to eq new_url
      end

      it "redirects to the updated app" do
        new_name = "app_5"
        new_url = "http://app_5.com"

        put :update, params: { id: my_app.id, registered_application: {name: new_name, url: new_url}}
        expect(response).to redirect_to my_app
      end
    end
  
    describe "DELETE destroy" do
      it "deletes the app" do
        delete :destroy, params: {id: my_app.id}
        count = RegisteredApplication.where({id: my_app.id}).size
        expect(count).to eq 0
      end

      it "redirects to registered_application index" do
        delete :destroy, params: {id: my_app.id}
        expect(response).to redirect_to registered_applications_path
      end
    end
  end

end
