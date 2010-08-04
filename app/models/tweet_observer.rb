class TweetObserver < ActiveRecord::Observer
  observe :post, :implementation, :question
  
  def after_create(model)
    tweet(model.tweet_title, model.tweet_path)
  end

  private
    def tweet(title, path)
      url = bitly.shorten("http://rails-bestpractices.com/#{path}").short_url
      twitter.update("#{title} #{url} #railsbp")
    end
    
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
