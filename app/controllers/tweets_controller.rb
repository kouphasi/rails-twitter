class TweetsController < ApplicationController
    before_action :redirect_if_has_not_logged_in
    
    has_create_error = false

    def index
        @tweets = Tweet.all
    end

    def new
        @tweet = Tweet.new
        @feeling = Feeling.all
        flag =  params[:error]
        if flag == "1"
            @error =true
        else
            @error = false
        end 

    end

    def create
        t = tweet_params
        tweet = Tweet.new(t)
        tweet.user_id = current_user.id
        if tweet.save
            redirect_to root_url
        else
            has_create_error = true
            redirect_to tweet_new_url(error: 1)
        end
    end

    def tweet_params
        params.require(:session).permit(:content, :feeling_id)
    end


    def comments
        @tweet = Tweet.find(params[:id])
        @comment = Comment.where(tweet_id: params[:id])
    end

end
