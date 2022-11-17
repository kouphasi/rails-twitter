class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "AccountTable"
  belongs_to :followed, class_name: "AccountTable"
end
