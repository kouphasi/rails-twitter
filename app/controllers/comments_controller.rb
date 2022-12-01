class CommentsController < ApplicationController
    def create
        comment = params[:session][:comment]
        tweet = Tweet.find(params[:tweet_id])
        # comment = tweet.comments.build(comment_params)
        
        comment = Comment.create(content: comment, account_table_id: current_user.id, tweet_id: tweet.id,  )

        if comment.save
            redirect_to request.referer
        end
    end
end
