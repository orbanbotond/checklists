class RestfullController < Subscribem::ApplicationController
  include InheritedResourcesWithPundit

  rescue_from Pundit::NotAuthorizedError, with: :redirect_to_recipes

  before_action :authenticate_user!
  after_action :verify_authorized

  def redirect_to_recipes
    redirect_to recipes_path, alert: 'You were not allowed to view that checklist'
  end

end