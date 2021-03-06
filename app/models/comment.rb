class Comment < ActiveRecord::Base

  include UserOwnable

  belongs_to :commentable, :counter_cache => true, :polymorphic => true, :touch => true
  validates_presence_of :body
  validates_presence_of :username, :if => Proc.new { |comment| !comment.user_id }

  scope :post, where(:commentable_type => 'Post').order("created_at desc")

  def self.per_page
    10
  end

  def parent_name
    case commentable
    when Question
      "Question #{commentable.title}"
    when Answer
      "Answer of #{commentable.question.title}"
    when Post
      "Post #{commentable.title}"
    end
  end

end
