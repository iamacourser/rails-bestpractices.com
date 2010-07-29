class Post < ActiveRecord::Base

  include Markdownable
  include UserOwnable

  acts_as_taggable

  has_many :comments, :as => :commentable, :dependent => :destroy
  has_many :votes, :dependent => :destroy
  has_one :implementation, :dependent => :destroy

  validates_presence_of :title, :body
  validates_uniqueness_of :title

  default_scope order('created_at desc')
  scope :search, lambda { |q| where(['title LIKE ?', "%#{q}%"]) }
  with_exclusive_scope do
    scope :hot, order('vote_points desc').limit(20)
    scope :implemented, where(:implemented => true).limit(20)
  end

  def self.per_page
    10
  end

  def tweet_title
    title
  end

  def tweet_path
    "posts/#{to_param}"
  end

  def vote(user)
    self.votes.where(:user_id => user.id).first
  end

  def to_param
    "#{id}-#{title.parameterize}"
  end

end
