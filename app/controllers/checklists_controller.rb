class ChecklistsController < RestfullController

  include Wisper::Publisher

  before_action :load_recipe, only: [:new, :index]

  def create
    @checklist = Checklist.new(checklist_params)
    if @checklist.save
      broadcast(:update_checklist, @checklist, current_account)
      @recipe = @checklist.recipe
      redirect_to recipe_checklists_path(@recipe)
    else
      render :new
    end
  end

  def update
    @checklist = Checklist.find params[:id]
    if @checklist.update checklist_params
      broadcast(:update_checklist, @checklist)
      @recipe = @checklist.recipe
      redirect_to recipe_checklists_path(@recipe)
    else
      render :new
    end
  end

  def show
    @checklist = Checklist.find params[:id]
  end

  def new
    if @recipe.present?
      @checklist = @recipe.new_checklist
    else
      @checklist = Checklist.new
      @checklist.tasks << Task.new
    end
  end

  def begin_of_association_chain
    Recipe.find(params[:recipe_id])
  end

  def index
    index!
  end

private

  def load_recipe
    if params[:recipe_id].present?
      @recipe = Recipe.find params[:recipe_id]
    end
  end

  def checklist_params
    params.require(:checklist).permit(:name, :recipe_id, tasks_attributes: [:id, :value, :description, :_destroy])
  end

end
