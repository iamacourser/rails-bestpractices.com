class Question < ActiveRecord::Base

  include Markdownable
  include UserOwnable
  include Voteable

  acts_as_taggable

  has_many :answers, :dependent => :destroy

  validates_presence_of :title, :body
  validates_uniqueness_of :title

  default_scope order('created_at desc')
  scope :not_answered, where(:answers_count => 0)
  with_exclusive_scope do
    scope :most_voted, order('vote_points desc')
    scope :most_answered, order('answers_count desc')
  end

  def self.per_page
    10
  end

  def tweet_title
    "Question: #{title}"
  end

  def tweet_path
    "questions/#{to_param}"
  end

  def to_param
    "#{id}-#{title.parameterize}"
  end

end
