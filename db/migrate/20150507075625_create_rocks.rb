class CreateRocks < ActiveRecord::Migration
  def change
    create_table :rocks do |t|
      t.references :field, index: true
      t.string :name
      t.string :type
      t.text :description

      t.timestamps null: false
    end
    add_foreign_key :rocks, :fields
  end
end
