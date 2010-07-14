class UserSession < Authlogic::Session::Base
  TOKEN="mozqcix7YNzq4hkPRZnA"
  SECRET="SOirJt1tklyNYguoYye8i5573baUAr2dQ7PgM6a2gE"
  
  def self.oauth_consumer
    OAuth::Consumer.new(TOKEN, SECRET,
    { :site=>"http://twitter.com",
      :authorize_url => "http://twitter.com/oauth/authenticate" })
  end
end

