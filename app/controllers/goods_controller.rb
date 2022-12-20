class GoodsController < ApplicationController

    def create
        if !Good.find_by(user_id: params[:user_id],tweet_id: params[:tweet_id])
            good = Good.new(user_id: current_user.id,tweet_id: params[:tweet_id])
            if good.save
                render json: {status:true}
            else
                render json: {status:false}
            end
        end

    end

    def delete
        if Good.find_by(user_id: params[:user_id],tweet_id: params[:tweet_id]).destroy
            render json: {status: true}
        else
            render json: {status: false}
        end

    end

    def index
        if Good.find_by(user_id: params[:user_id],tweet_id: params[:tweet_id])
            render json: {status: true}
        else
            render json: {status: false}
        end
    end

end
