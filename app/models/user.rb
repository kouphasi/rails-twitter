class User < ApplicationRecord
    has_secure_password
    has_many :tweets
    has_many :owners, class_name: "Relationship", foreign_key: :owner_id
    has_many :followed, class_name: "Relationship", foreign_key: :followed_id
    has_many :following_user, through: :owners, source: :followed # 自分がフォローしている人
    has_many :follower_user, through: :followed, source: :owners # 自分をフォローしている人
    has_many :comments, dependent: :destroy
    #インスタンスメソッドの定義
    def follow(user_id)
        #selfはオブジェクトそのものを取得している。->"user".follow
        owners.create(followed_id: user_id, owner_id: self.id)
    end

    def unfollow(user_id)
        owners.find_by(followed_id: user_id).destroy
    end

    def following?(user_id)
        owners.find_by(followed_id: user_id).present?
    end
end
