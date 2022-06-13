class TweetsController < ApplicationController
    before_action :require_user_logged_in!
    before_action :set_tweet, only: [:show, :edit, :update, :destroy]

    def index
        @tweets = Current.user.tweets.order(created_at: :desc)
    end

    def new
        @tweet = Tweet.new
    end

    def create
        @tweet = Current.user.tweets.new(tweet_params)
        if @tweet.save
            redirect_to tweets_path, notice:  "Tweet was successfully scheduled🎉"
        else
            flash.now[:danger] = "An error occurred while scheduling your tweet😞"
            render :new
        end
    end

    def show
    end
    

    def edit
    end

    def update
        if @tweet.update(tweet_params)
            redirect_to tweets_path, notice: "Tweet was successfully updated🎉"
        else
            flash.now[:danger] = "An error occurred while updating your tweet😞"
            render :edit
        end
    end

    def destroy
        @tweet.destroy
        redirect_to tweets_path, notice: "Tweet was successfully deleted🎉"
    end



    private

    def tweet_params
        params.require(:tweet).permit(:twitter_account_id,:body, :publish_at)
    end

    def set_tweet
        @tweet = Current.user.tweets.find(params[:id])
    end
end
