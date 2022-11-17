class RelationshipsController < ApplicationController
    def create
        current_user.follow(params[:account_table_id])
        redirect_to request.referer
    end
    def destroy
        current_user.unfollow(params[:account_table_id])
        redirect_to request.referer
    end
end
