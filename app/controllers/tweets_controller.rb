class TweetsController < ApplicationController
    before_action :redirect_if_has_not_logged_in?
    
    def index
        @tweets = Tweet.all
    end

    def new
        @tweet = Tweet.new
    end

    def create
        t = tweet_params
        tweet = Tweet.new(t)
        tweet.user_id = current_user.id
        if tweet.save
            redirect_to root_url
        else
            redirect_to tweet_new_url
        end
    end

    def tweet_params
        params.require(:session).permit(:content)
    end


    def comments
        @tweet = Tweet.find(params[:id])
        @comment = Comment.where(tweet_id: params[:id])
    end
end
