require "rails_helper"
require_relative 'restfull_routes'

describe "routes for the checklist" do
  it_behaves_like 'Restfull Resource Routes', :checklist
end