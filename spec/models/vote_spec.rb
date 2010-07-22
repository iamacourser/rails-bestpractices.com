require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Vote do

  should_belong_to :user
  should_belong_to :post

  describe 'when created' do

    before do
      @post = Factory(:post)
      @orig_vote_point = @post.vote_points
    end

    it "should increment corresponding Post#vote_points if indicated as 'like'" do
      Factory(:vote, :post => @post, :like => true)
      @post.vote_points.should equal(@orig_vote_point.succ)
    end

    it "should decrement corresponding Post#vote_points if indicated as 'don like'" do
      Factory(:vote, :post => @post, :like => false)
      @post.vote_points.should equal(@orig_vote_point.pred)
    end

  end

  describe 'when deleted' do

    before do
      @post = Factory(:post)
      @orig_vote_point = @post.vote_points
    end

    it "should decrement corresponding Post#vote_points if indicated as 'like'" do
      (vote = Factory(:vote, :post => @post, :like => true)).destroy
      @post.vote_points.should equal(@orig_vote_point)
    end

    it "should increment corresponding Post#vote_points if indicated as 'don like'" do
      (vote = Factory(:vote, :post => @post, :like => false)).destroy
      @post.vote_points.should equal(@orig_vote_point)
    end

  end

end
