module Tweetable
  def self.included(base)
    base.class_eval do
      after_create :async_tweet
    end
  end

  def async_tweet
    Resque.enqueue(Resque::TweetJob, tweet_content)
  end
end
