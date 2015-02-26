class ChecklistListener
  def update_checklist(checklist, account)
    checklist.recipe ||= Recipe.create name: checklist.name, account_id: account.id
    checklist.save
    recipe = checklist.recipe
    checklist.tasks.each do |task|
      recipe.tasks.create description: task.description unless recipe.tasks.pluck(:description).include?(task.description)
    end
  end
end
