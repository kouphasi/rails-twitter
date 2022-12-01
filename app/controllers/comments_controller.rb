class CommentsController < ApplicationController
    def create
        tweet = Tweet.find(params[:tweet_id])
        comment = tweet.comments.build(comment_params)
        comment.user_id = current_user.id

        if comment.save
            redirect_back(fallback_location: root_path)
        end
    end
end
