class AccountTable < ApplicationRecord
    has_secure_password
    has_many :tweets
end
