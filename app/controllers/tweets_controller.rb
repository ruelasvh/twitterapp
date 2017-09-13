class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :update, :destroy]

  # GET /tweets
  def index
    @tweets = @current_user.tweets.select('message, created_at').as_json(:except => :id)

    render json: @tweets, status: :ok
  end

  # POST /tweet
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = @current_user

    if @tweet.save
      render json: {message: 'Your tweet has been posted!'}, status: :created, location: @tweet
    else
      render json: @tweet.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tweet_params
      params.require(:tweet).permit(:message)
    end
end
