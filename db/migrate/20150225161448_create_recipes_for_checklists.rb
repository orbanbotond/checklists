class CreateRecipesForChecklists < ActiveRecord::Migration
  include Wisper::Publisher

  def change
    Checklist.find_each do |cl|
      broadcast(:update_recipe, cl)
      cl.reload
      recipe = cl.recipe
      recipe.account = cl.account
      recipe.save
    end
  end
end
