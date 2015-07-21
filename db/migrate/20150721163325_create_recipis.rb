class CreateRecipis < ActiveRecord::Migration
  def change
    create_table :recipis do |t|
      t.string :name
      t.text :instructions

      t.timestamps null: false
    end
  end
end
