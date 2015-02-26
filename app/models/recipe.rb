class Recipe < ActiveRecord::Base
  scoped_to_account

  has_many  :checklists
  has_many  :tasks, as: :checkable

  validates :name,
          :presence => true

  def new_checklist
    checklist = Checklist.new name: name, recipe_id: id
    tasks.each do |t|
      checklist.tasks.build description: t.description
    end
    checklist
  end
end
