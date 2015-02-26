class AddAccountIdToRecipe < ActiveRecord::Migration
  def change
    add_reference :recipes, :account, index: true
    add_foreign_key :recipes, :subscribem_accounts, column: :account_id
  end
end
