module Commentable

  def self.included(base)
    base.class_eval do
      has_many :comments, :as => :commentable, :dependent => :destroy
    end
  end

end
