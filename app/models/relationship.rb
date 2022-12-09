class Relationship < ApplicationRecord
  belongs_to :owners, class_name: "User", foreign_key: :owner_id
  belongs_to :followed, class_name: "User", foreign_key: :followed_id
end
