class RemoveColumnsFromAccountTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :account_tables, :password, :string
  end
end
