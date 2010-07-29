class User < ActiveRecord::Base
  include ConnectProfile
  acts_as_authentic
  is_gravtastic!
  
  has_many :posts, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :votes, :dependent => :destroy
  has_many :implementations, :dependent => :destroy

  after_create :update_profile

  private
    def update_profile
      if self.profile
        self.update_attribute(:login, self.profile[:name])
      end
    end
end
