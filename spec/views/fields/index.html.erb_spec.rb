require 'rails_helper'

RSpec.describe "fields/index", type: :view do
  before(:each) do
    assign(:fields, [
      Field.create!(),
      Field.create!()
    ])
  end

  it "renders a list of fields" do
    render
  end
end
