class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description
      t.boolean :value
      t.references :checklist, index: true

      t.timestamps null: false
    end
    add_foreign_key :tasks, :checklists
  end
end
