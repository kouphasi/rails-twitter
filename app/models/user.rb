class User < ApplicationRecord
    has_secure_password
    has_many :tweets
    has_many :owner, class_name: "Relationship", foreign_key: :owner_id
    has_many :followed, class_name: "Relationship", foreign_key: :followed_id
    has_many :following_user, through: :owner, source: :followed # 自分がフォローしている人
    has_many :follower_user, through: :followed, source: :owner # 自分をフォローしている人
    has_many :comments, dependent: :destroy

    def follow(user_id, current_user_id)
        owner.create(followed_id: user_id, owner_id: current_user_id)
    end

    def unfollow(user_id)
        owner.find_by(followed_id: user_id).destroy
    end

    def following?(user)
        owner.find_by(followed_id: user.id).present?
    end
end
