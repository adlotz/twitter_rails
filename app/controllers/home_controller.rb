class HomeController < ApplicationController
  def index
  end

  def post
  	  	if SendTweet.new(tweet_params[:tweet]).perform
  		flash[:success] = 'Tweet envoyé'
  		redirect_to root_path
  	else
  		flash[:danger] = "Erreur, le tweet n'est pas envoyé!"
  		redirect_to root_path
  	
  	end
end

  private
  	def tweet_params
      params.permit(:tweet)
  	end
end

