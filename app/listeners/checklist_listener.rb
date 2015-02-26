class ChecklistListener
  def update_checklist(checklist)
    checklist.recipe ||= Recipe.create name: checklist.name
    checklist.save
    recipe = checklist.recipe
    checklist.tasks.each do |task|
      recipe.tasks.create description: task.description unless recipe.tasks.pluck(:description).include?(task.description)
    end
  end
end
