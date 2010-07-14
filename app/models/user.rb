class User < ActiveRecord::Base
  acts_as_authentic
  is_gravtastic!

  has_many :posts, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :votes, :dependent => :destroy

  after_create :populate_oauth_user
  
  def populate_oauth_user
    unless oauth_token.blank?
      @response = UserSession.oauth_consumer.request(:get, '/account/verify_credentials.json',
      access_token, { :scheme => :query_string })
      case @response
      when Net::HTTPSuccess
        user_info = JSON.parse(@response.body)

        self.login        = user_info['name']
        self.save
      end
    end
  end

end
