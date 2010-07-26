TWITTER_YAML = Rails.root.join('config', 'twitter.yml')
TWITTER_CONFIG = YAML.load_file(TWITTER_YAML)[Rails.env] rescue nil

BITLY_YAML = Rails.root.join('config', 'bitly.yml')
BITLY_CONFIG = YAML.load_file(BITLY_YAML)[Rails.env] rescue nil

module Tweetable
  unless Rails.env == 'production'
    def tweet
    end
  end
end
