class Comment < ActiveRecord::Base

  include UserOwnable

  belongs_to :commentable, :polymorphic => true, :counter_cache => true
  validates_presence_of :body
  validates_presence_of :username, :if => Proc.new { |comment| !comment.user_id }

  scope :post, where(:commentable_type => 'Post').order("created_at desc")
  scope :implement, where(:commentable_type => 'Implement').order("created_at desc")

  def self.per_page
    20
  end

  def parent_name
    if commentable.is_a? Post
      commentable.title
    elsif commentable.is_a? Implementation
      "#{commentable.post.title} implementation"
    end
  end
end
