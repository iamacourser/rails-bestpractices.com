require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe User do

  before do
    Factory.create(:user)
  end

  extend RailsBestPractices::Macros
  should_be_gravastic
  should_act_as_authentic # This affects the validity of a user

  should_have_many :posts
  should_have_many :comments
  should_have_many :votes
  should_have_many :implementations

end
