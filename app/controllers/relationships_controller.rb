class RelationshipsController < ApplicationController
    def create
        current_user.follow(params[:user_id], current_user.id)
        redirect_to request.referer
    end
    def destroy
        current_user.unfollow(params[:user_id])
        redirect_to request.referer
    end

    def account
        @user = User.find(params[:id])
        # @tweet = Tweet.where(user_id: params[:id])
        @tweet = @user.tweets
    end
    
    def user_page
        @user = User.find(params[:id])
    end

    def followlist
        @follow = current_user.owner
        @follower = current_user.followed
    end
end
