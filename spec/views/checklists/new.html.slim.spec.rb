require 'rails_helper' 

describe 'checklists/new' do
  let(:checklist) { build :checklist }
  it "the page has a form" do
    assign :checklist, checklist
    render
    expect(rendered).to have_selector( "form")
  end
  it "the page has an input for the checklist name" do
    assign :checklist, checklist
    render
    expect(rendered).to have_selector( "#checklist_name")
  end
end