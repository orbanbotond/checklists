require 'rails_helper'

RSpec.describe "fields/show", type: :view do
  before(:each) do
    @field = assign(:field, Field.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
