class RelationshipsController < ApplicationController
    def create
        # puts 1+1
        # puts params[:user_id]
        current_user.follow(params[:user_id], current_user.id)
        redirect_to request.referer
    end
    def destroy
        current_user.unfollow(params[:user_id])
        redirect_to request.referer
    end

    def account
        @user = User.find(params[:id])
        @tweet = Tweet.where(user_id: params[:id])
    end
    
    def user_page
        @user = User.find(params[:id])
    end

    def followlist
        @follow = Relationship.where(follower_id: current_user.id)
        @follower = Relationship.where(followed_id: current_user.id)
    end
end
