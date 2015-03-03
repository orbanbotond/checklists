class ChecklistsController < RestfullController
  include DisplayCase::ExhibitsHelper
  include Wisper::Publisher

  before_action :load_recipe, only: [:new, :index]
  rescue_from ActiveRecord::RecordNotFound, with: :no_resource_found

  def show
    @checklist = Checklist.find params[:id]
    authorize @checklist
  end

  def create
    @checklist = Checklist.new(checklist_params)
    authorize @checklist
    if @checklist.save
      post_process @checklist, current_account
    else
      render :new
    end
  end

  def update
    @checklist = Checklist.find params[:id]
    authorize @checklist
    if @checklist.update checklist_params
      post_process @checklist, current_account
    else
      render :new
    end
  end

  def new
    if @recipe.present?
      @checklist = @recipe.new_checklist
    else
      @checklist = Checklist.new
      @checklist.tasks << Task.new
    end
    authorize @checklist
  end

  def begin_of_association_chain
    Recipe.find(params[:recipe_id])
  end

  def collection
    collection_without_authority
    authorize @recipe
    exhibit(get_collection_ivar)
  end

private

  def post_process checklist, account
    broadcast :update_recipe, checklist, account
    @recipe = checklist.reload.recipe
    redirect_to recipe_checklists_path(@recipe)
  end

  def load_recipe
    if params[:recipe_id].present?
      @recipe = Recipe.find params[:recipe_id]
    end
  end

  def checklist_params
    params.require(:checklist).permit(:name, :recipe_id, tasks_attributes: [:id, :value, :description, :_destroy])
  end

  def no_resource_found
    redirect_to recipes_path, alert: 'There was no resource with that id.'
  end

end
