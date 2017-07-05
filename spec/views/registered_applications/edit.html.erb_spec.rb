require 'rails_helper'

RSpec.describe "registered_applications/edit", type: :view do
  before(:each) do
    @registered_application = assign(:registered_application, RegisteredApplication.create!(
      :name => "MyString",
      :url => "MyString"
    ))
  end

  it "renders the edit registered_application form" do
    render

    assert_select "form[action=?][method=?]", registered_application_path(@registered_application), "post" do

      assert_select "input[name=?]", "registered_application[name]"

      assert_select "input[name=?]", "registered_application[url]"
    end
  end
end
