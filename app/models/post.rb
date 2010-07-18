class Post < ActiveRecord::Base
  include Markdownable
  include Tweetable
  acts_as_taggable
  
  belongs_to :user
  has_many :comments, :as => :commentable, :dependent => :destroy
  has_many :votes, :dependent => :destroy
  has_one :implementation, :dependent => :destroy
  
  validates_presence_of :title, :body
  validates_uniqueness_of :title
  
  default_scope order('created_at desc')
  with_exclusive_scope do
    scope :hot, order('vote_points desc').limit(20)
  end
  
  def self.per_page
    10
  end

  def tweet_content
    bitly = load_bitly
    url = bitly.shorten("http://rails-bestpractices/posts/#{self.to_param}").short_url
    "#{self.title} #{url}"
  end
  
  def belongs_to?(user)
    user && user_id == user.id
  end

  def vote(user)
    self.votes.where(:user_id => user.id).first
  end
  
  def to_param
    return "#{id}-#{title.parameterize}"
  end
end
