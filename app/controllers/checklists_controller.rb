class ChecklistsController < RestfullController

  def new
    @checklist = Checklist.new
    @checklist.tasks << Task.new
  end

  def collection
    end_of_association_chain.scoped_to(current_account)
  end

 private

  def checklist_params
    params.require(:checklist).permit(:name, tasks_attributes: [:value, :description])
  end

end
