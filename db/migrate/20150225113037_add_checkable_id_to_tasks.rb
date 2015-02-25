class AddCheckableIdToTasks < ActiveRecord::Migration
  def change
    add_reference :tasks, :checkable, polymorphic: true, index: true

    Task.find_each do |t|
      t.checkable = t.checklist
      t.save
    end
  end
end
