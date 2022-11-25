class RelationshipsController < ApplicationController
    def create
        current_user.follow(params[:account_table_id])
        redirect_to request.referer
    end
    def destroy
        current_user.unfollow(params[:account_table_id])
        redirect_to request.referer
    end

    def account
        @user = AccountTable.find(params[:id])
    end
    
    def user_page
        @user = AccountTable.find(params[:id])
    end
end
