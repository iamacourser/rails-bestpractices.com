class Implementation < ActiveRecord::Base

  include Markdownable
  include Tweetable
  include UserOwnable

  belongs_to :post
  has_many :comments, :as => :commentable, :dependent => :destroy
  validates_presence_of :body

  def self.per_page
    10
  end

  def tweet_content
    bitly = load_bitly
    url = bitly.shorten("http://rails-bestpractices.com/posts/#{post.to_param}/implementation").short_url
    "Implementation of #{post.title} #{url} #railsbp"
  end

end
