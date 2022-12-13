class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  belongs_to :feeling, optional: true

  validates :content, length:  {maximum:255}, presence: true
  validates :feeling_id, presence: true
end
