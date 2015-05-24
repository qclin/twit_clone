class TweetsController < ApplicationController
  before_action :logged_in_user

  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save 
       render json: @tweet
    else 
      render status: 400, nothing: true
    end 
  end

  def destroy 
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
  end 

  private
  def tweet_params
    params.require(:tweet).permit(:content)
  end

end 
