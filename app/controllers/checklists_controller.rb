class ChecklistsController < RestfullController

  def create
    @checklist = Checklist.new(checklist_params)
    @checklist.account_id = current_account.id
    create! { account_root_path }
  end

  def new
    @checklist = Checklist.new
    @checklist.tasks << Task.new
  end

  def collection
    end_of_association_chain.scoped_to(current_account)
  end

 private

  def checklist_params
    params.require(:checklist).permit(:name, tasks_attributes: [:id, :value, :description, :_destroy])
  end

end
