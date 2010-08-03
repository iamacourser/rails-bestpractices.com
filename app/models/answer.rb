class Answer < ActiveRecord::Base

  include Markdownable
  include UserOwnable
  include Voteable

  belongs_to :question, :counter_cache => true
  validates_presence_of :body

  def self.per_page
    10
  end

  def to_post
    Post.new(:title => self.question.title, :body => self.body, :tag_list => self.question.tag_list)
  end

  def tweet_title
    "Answer for #{question.title}"
  end

  def tweet_path
    "questions/#{question.to_param}"
  end
end
