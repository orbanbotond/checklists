class RecipeListener
  def update_recipe(checklist, account)
    if checklist.recipe.nil? || checklist.name != checklist.recipe.name
      checklist.recipe = Recipe.create name: checklist.name, account_id: account.id
      checklist.save
    end

    recipe = checklist.recipe
    checklist.tasks.each do |task|
      recipe.tasks.create description: task.description unless recipe.tasks.pluck(:description).include?(task.description)
    end
    checklist
  end
end
