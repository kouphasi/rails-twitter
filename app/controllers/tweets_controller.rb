class TweetsController < ApplicationController
    before_action :logged_in_user, only:[:edit, :update, :destroy]

    def main
        @tweets = Tweet.all
    end

    def newp
        @tweet = Tweet.new
    end

    def add
        t = tweet_params
        tweet = Tweet.new(t)
        # puts tweet
        tweet.account_table_id = current_user.id
        # puts tweet
        puts tweet.save!
        if tweet.save
            redirect_to root_url
        else
            redirect_to new_url
        end
    end

    def tweet_params
        params.require(:session).permit(:contents)
    end

    # def index
    #     @tweets = Tweet.all
    # end

    def comments
        @tweet = Tweet.find(params[:id])
        @comment = Comment.where(tweet_id: params[:id])
    end
end
