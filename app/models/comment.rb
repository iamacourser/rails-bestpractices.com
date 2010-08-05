class Comment < ActiveRecord::Base

  include UserOwnable

  belongs_to :commentable, :polymorphic => true, :touch => true
  validates_presence_of :body
  validates_presence_of :username, :if => Proc.new { |comment| !comment.user_id }

  scope :post, where(:commentable_type => 'Post').order("created_at desc")
  scope :implement, where(:commentable_type => 'Implementation').order("created_at desc")

  def self.per_page
    20
  end

  def parent_name
    case commentable
    when Question
      "Question #{commentable.title}"
    when Answer
      "Answer of #{commentable.question.title}"
    when Post
      "Post #{commentable.title}"
    when Implementation
      "Implementation of #{commentable.post.title}"
    end
  end

end
