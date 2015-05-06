require 'rails_helper'

RSpec.describe "fields/new", type: :view do
  before(:each) do
    assign(:field, Field.new())
  end

  it "renders new field form" do
    render

    assert_select "form[action=?][method=?]", fields_path, "post" do
    end
  end
end
