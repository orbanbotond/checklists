require "rails_helper"
require_relative 'restfull_routes'

describe "routes for the recipes" do
  it_behaves_like 'Restfull Resource Routes', :recipes, [:index]
end
