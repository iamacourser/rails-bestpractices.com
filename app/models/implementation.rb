class Implementation < ActiveRecord::Base

  include Markdownable
  include Tweetable

  belongs_to :user
  belongs_to :post
  has_many :comments, :as => :commentable, :dependent => :destroy
  validates_presence_of :body

  def self.per_page
    10
  end

  def belongs_to?(user)
    user && user_id == user.id
  end

  def tweet_content
    bitly = load_bitly
    url = bitly.shorten("http://rails-bestpractices.com/posts/#{post.to_param}/implementation").short_url
    "Implementation of #{post.title} #{url} #railsbp"
  end

end
