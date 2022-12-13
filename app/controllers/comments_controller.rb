class CommentsController < ApplicationController
    def create
        comment = params[:session][:comment]
        tweet = Tweet.find(params[:tweet_id])
        
        comment = Comment.create(content: comment, user_id: current_user.id, tweet_id: tweet.id, isComment: true  )

        if comment.save
            redirect_to request.referer
        end
    end
end
