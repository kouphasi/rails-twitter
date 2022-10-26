class CreateAccountTables < ActiveRecord::Migration[6.1]
  def change
    create_table :account_tables do |t|
      t.integer :userId
      t.string :name
      t.string :password

      t.timestamps
    end
  end
end
