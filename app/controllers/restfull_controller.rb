class RestfullController < Subscribem::ApplicationController
  inherit_resources

  before_action :authenticate_user!
end