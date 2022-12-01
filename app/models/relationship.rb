class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "AccountTable", foreign_key: :follower_id
  belongs_to :followed, class_name: "AccountTable", foreign_key: :followed_id
end
