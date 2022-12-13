class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  belongs_to :feeling
end
