require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Implementation do

  include RailsBestPractices::Macros
  should_be_tweetable
  should_be_markdownable

  should_belong_to :user
  should_belong_to :post
  should_have_many :comments, :dependent => :destroy
  should_validate_presence_of :body

  it 'should have 10 implementations per page' do
    Implementation.per_page.should equal(10)
  end

  it 'should be owned by someone if he is the owner of it' do
    someone = Factory(:user)
    Factory(:implementation, :user => someone).belongs_to?(someone).should be_true
  end

  it 'should not be owned by someone if he is not the owner of it' do
    someone = Factory(:user)
    Factory(:implementation).belongs_to?(someone).should be_false
  end

end
