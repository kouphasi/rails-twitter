class RemoveUserIdFromAccountTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :account_tables, :userId, :integer
  end
end
