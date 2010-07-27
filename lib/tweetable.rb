module Tweetable

  def self.included(base)
    base.class_eval do
      after_create :tweet
    end
  end

  def tweet
    url = bitly.shorten("http://rails-bestpractices.com/#{tweet_path}").short_url
    twitter.update("#{tweet_title} #{url} #railsbp")
  end

  private
    def twitter
      config = TWITTER_CONFIG
      httpauth = Twitter::HTTPAuth.new(config['email'], config['password'])
      Twitter::Base.new(httpauth)
    end

    def bitly
      config = BITLY_CONFIG
      Bitly.new(config['username'], config['api_key'])
    end

end
