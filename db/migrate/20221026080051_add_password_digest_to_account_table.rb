class AddPasswordDigestToAccountTable < ActiveRecord::Migration[6.1]
  def change
    add_column :account_tables, :password_digest, :string
  end
end
