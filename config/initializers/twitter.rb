TWITTER_YAML = Rails.root.join('config', 'twitter.yml')
TWITTER_CONFIG = YAML.load_file(TWITTER_YAML)[Rails.env]

BITLY_YAML = Rails.root.join('config', 'bitly.yml')
BITLY_CONFIG = YAML.load_file(BITLY_YAML)[Rails.env]
