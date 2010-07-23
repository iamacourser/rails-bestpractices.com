class Comment < ActiveRecord::Base

  include UserOwnable

  belongs_to :commentable, :polymorphic => true, :counter_cache => true
  validates_presence_of :body
  validates_presence_of :username, :if => Proc.new { |comment| !comment.user_id }

end
