class Tweet < ApplicationRecord
  belongs_to :account_table
  has_many :comments, dependent: :destroy
end
