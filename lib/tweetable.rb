module Tweetable
  if Rails.env == 'production'
    def self.included(base)
      base.class_eval do
        after_create :async_tweet
      end
    end

    BITLY_YAML = Rails.root.join('config', 'bitly.yml')

    def load_bitly
      config = YAML.load_file(BITLY_YAML)[RAILS_ENV]
      Bitly.new(config['username'], config['api_key'])
    end

    def async_tweet
      Resque.enqueue(Resque::TweetJob, tweet_content)
    end
  end
end
