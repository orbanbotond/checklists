class RemoveAccountIdFromChecklist < ActiveRecord::Migration
  def change
    remove_column :checklists, :account_id, :integer
  end
end
