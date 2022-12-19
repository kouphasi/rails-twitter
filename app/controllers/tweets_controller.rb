class TweetsController < ApplicationController
    before_action :redirect_if_has_not_logged_in
    

    def index
        @tweets = Tweet.all
    end

    def new
        @tweet = Tweet.new
        @feeling = Feeling.all

    end

    def create
        t = tweet_params
        tweet = Tweet.new(t)
        tweet.user_id = current_user.id
        if tweet.save
            redirect_to root_url
        else
            #flash[:notice] = ""
            #redirect_to
            #と同じ
            redirect_to tweet_new_url, notice: "正しく入力してください"
        end
    end
    
    def comments
        @tweet = Tweet.find(params[:id])
        @comment = Comment.where(tweet_id: params[:id])
    end

    private
    def tweet_params
        params.require(:session).permit(:content, :feeling_id)
    end



end
