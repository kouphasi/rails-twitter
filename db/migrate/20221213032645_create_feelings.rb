class CreateFeelings < ActiveRecord::Migration[6.1]
  def change
    create_table :feelings do |t|
      t.string :text

      t.timestamps
    end
    Feeling.create!(text:"happy")
    Feeling.create!(text:"sad")
    Feeling.create!(text:"normal")
    Feeling.create!(text:"angry")
    Feeling.create!(text:"exhausted")
    Feeling.create!(text:"energetic")
    Feeling.create!(text:"discouraged")
  end
end
