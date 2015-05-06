require 'rails_helper'

RSpec.describe "fields/edit", type: :view do
  before(:each) do
    @field = assign(:field, Field.create!())
  end

  it "renders the edit field form" do
    render

    assert_select "form[action=?][method=?]", field_path(@field), "post" do
    end
  end
end
