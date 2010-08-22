require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe NotificationsHelper do
  describe "should notification message" do
    it "should display for comment" do
      post_user = Factory(:user, :login => 'post_user')
      post = Factory(:post, :title => 'notifierable post', :user => post_user)
      comment_user = Factory(:user, :login => 'comment_user')
      comment = Factory(:comment, :commentable => post)
      notification = Factory(:notification, :notifierable => comment, :user => post_user)
      
      pending "how to rspec one helper with another helper"
      #helper.notification_message(notification).should == "#{comment_user_link(comment)} posts a comment on #{comment_parent_link(comment)}"
    end
  end
end
