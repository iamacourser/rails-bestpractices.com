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
    {
      :title => "Implementation of #{post.title}",
      :path => "posts/#{post.to_param}/implementation"
    }
  end

end
