class CreateFeelings < ActiveRecord::Migration[6.1]
  def change
    create_table :feelings do |t|
      t.string :text

      t.timestamps
    end
  end
end
