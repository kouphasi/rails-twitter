class Comment < ApplicationRecord
  belongs_to :account_table
  belongs_to :tweet
end
