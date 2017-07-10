require 'rails_helper'
require 'factory_girl_rails'
include FactoryGirl

# http://matthewlehner.net/rails-api-testing-guidelines/
# http://jbilbo.com/blog/2015/05/19/testing-cors-with-rspec/

RSpec.describe API::EventsController, type: :controller do
  let(:my_user) { create(:user) }
  let(:my_app) { create(:registered_application, user: my_user, url: "http://registered_application.com") }

  context "registered application" do
    
    #before do
    #  controller.request.env['HTTP_ORIGIN'] = my_app.url
    #  post :create, params: {event: { name: "About Page Load" }}
    #end
    
    #describe "POST create" do
    #  it 'Returns the response CORS headers' do
    #    @request.env['HTTP_ORIGIN'] = my_app.url
    #    post :create, params: { event: { name: "About Page Load"}}
    #    expect(response.headers['Access-Control-Allow-Origin']).to eq('*')
    #  end
    #end
    
  end

end