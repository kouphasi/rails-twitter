class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.integer :userId
      t.string :contents

      t.timestamps
    end
  end
end
