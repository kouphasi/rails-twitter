class TweetsController < ApplicationController
    before_action :logged_in_user, only:[:edit, :update, :destroy]

    def main
    end

    def newp
        @tweet = Tweet.new
    end

    def add
        puts tweet_params
        tweet = Tweet.new(tweet_params)
        # if tweet.save
        #     redirect_to root_url
        # else
        #     redirect_to new_url
        # end
    end


end
