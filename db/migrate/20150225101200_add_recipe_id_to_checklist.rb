class AddRecipeIdToChecklist < ActiveRecord::Migration
  def change
    add_reference :checklists, :recipe, index: true
    add_foreign_key :checklists, :recipes
  end
end
