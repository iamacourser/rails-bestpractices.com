module Resque
  class TweetJob

    @queue = :tweet

    TWIITER_YAML = Rails.root.join('config', 'twitter.yml')
    TWIITER_CONFIG = YAML.load_file(TWIITER_YAML)[Rails.env] rescue nil

    BITLY_YAML = Rails.root.join('config', 'bitly.yml')
    BITLY_CONFIG = YAML.load_file(BITLY_YAML)[Rails.env] rescue nil

    def self.perform(content)
      title, path = content['title'], content['path']
      url = bitly.shorten("http://rails-bestpractices.com/#{path}").short_url
      twitter.update("#{title} #{url} #railsbp")
    end

    def self.twitter
      config = TWIITER_CONFIG
      httpauth = Twitter::HTTPAuth.new(config['email'], config['password'])
      Twitter::Base.new(httpauth)
    end

    def self.bitly
      config = BITLY_CONFIG
      Bitly.new(config['username'], config['api_key'])
    end

  end
end
