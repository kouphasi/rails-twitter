class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.text :contents
      t.references :account_table, null: false, foreign_key: true

      t.timestamps
    end
  end
end
