class AccountTable < ApplicationRecord
    has_secure_password
    has_many :tweets
    has_many :follower, class_name: "Relationship"
    has_many :followed, class_name: "Relationship"
    has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
    has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人
    has_many :comments, dependent: :destroy

    def follow(account_table_id)
        follower.create(followed_id: account_table_id)
    end

    def unfollow(user_id)
        follower.find_by(followed_id: user_id).destroy
    end

    def following?(user)
        following_user.include?(user)
    end
end
