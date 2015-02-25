class Recipe < ActiveRecord::Base
  has_many  :checklists
  has_many  :tasks, as: :checkable

  validates :name,
          :presence => true

  def create_checklist
    checklist = Checklist.create name: name
    tasks.each do |t|
      checklist.tasks.create description: t.description
    end
    checklist
  end
end
