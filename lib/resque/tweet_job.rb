class Resque::TweetJob
  @queue = :tweet

  def self.perform(content)
    config = self.load_configuration
    httpauth = Twitter::HTTPAuth.new(config['email'], config['password'])
    base = Twitter::Base.new(httpauth)
    base.update(content)
  end

  TWIITER_YAML = Rails.root.join('config', 'twitter.yml')

  private
    def self.load_configuration
      YAML.load_file(TWIITER_YAML)[RAILS_ENV]
    end
end
