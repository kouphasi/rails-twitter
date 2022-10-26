class ChangeDataTitleToArticle < ActiveRecord::Migration[6.1]
  def change
    change_column :account_tables, :userId, :string
  end
end
