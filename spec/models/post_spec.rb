require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Post do

  before :each do
    @post = Factory.create(:post)
  end

  include RailsBestPractices::Macros
  should_act_as_taggable
  should_be_tweetable
  should_be_markdownable
  should_be_user_ownable
  should_have_entries_per_page 10

  should_have_many :comments, :dependent => :destroy
  should_have_many :votes, :dependent => :destroy
  should_have_one :implementation, :dependent => :destroy
  should_validate_presence_of :title, :body
  should_validate_uniqueness_of :title

  it 'should be sorted descendingly by creation time given default scope' do
    Post.delete_all
    posts = %w{1 2}.map{|day| Factory(:post, :created_at => "2010-01-0#{day} 09:00") }
    Post.all.map(&:id).should == posts.map(&:id).reverse
  end

  it 'should exclusively be sorted descendingly by vote_points given hot scope' do
    Post.delete_all
    posts = [[1, 2], [2,1]].map do |(point,day)|
      Factory(:post, :vote_points => point, :created_at => "2010-01-0#{day} 09:00")
    end
    Post.hot.map(&:id).should == posts.map(&:id).reverse
  end

  it "should support retrieving of any user's 1st vote" do
    jane, peter = (0..1).map{|_| Factory(:user) }
    post = Factory(:post)
    post.votes.create(:user => peter)
    post.votes.create(:user => jane)
    post.votes.create(:user => jane)
    post.vote(jane).should == post.votes[1]
  end

end
