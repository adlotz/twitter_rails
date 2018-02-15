require 'twitter'
require 'dotenv-rails'

class SendTweet
	def initialize(tweet)
    	@tweet = tweet
  	end

	def perform
		log_in_to_twitter
		send_tweet
	end

	def log_in_to_twitter
	@client = Twitter::REST::Client.new do |config|
  		config.consumer_key        = ENV['key']
  		config.consumer_secret     = ENV['secret']
  		config.access_token        = ENV['token']
  		config.access_token_secret = ENV['tokensec']
	end
	end

	def send_tweet
		@client.update(@tweet)
	end
end