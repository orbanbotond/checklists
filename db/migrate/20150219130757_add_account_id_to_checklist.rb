class AddAccountIdToChecklist < ActiveRecord::Migration
  def change
    add_column :checklists, :account_id, :integer
    add_index :checklists, :account_id
    add_foreign_key :checklists, :subscribem_accounts, column: :account_id
  end
end
