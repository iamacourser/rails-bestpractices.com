require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Notification do

  include RailsBestPractices::Spec::Support
  
  should_have_entries_per_page 10
  should_belong_to :notifierable, :polymorphic => true

  describe "notification count" do
    it "should increase notification count" do
      user = Factory(:user)
      comment = Factory(:comment)
      user.notifications.create(:notifierable => comment)
      user.reload
      user.unread_notification_count.should == 1
      user.notifications.create(:notifierable => comment)
      user.reload
      user.unread_notification_count.should == 2
    end

    it "should decrease notification count when read" do
      user = Factory(:user)
      comment = Factory(:comment)
      notification1 = user.notifications.create(:notifierable => comment)
      notification2 = user.notifications.create(:notifierable => comment)
      user.reload
      user.unread_notification_count.should == 2
      notification1.reload
      notification1.read!
      user.reload
      user.unread_notification_count.should == 1
      notification2.reload
      notification2.read!
      user.reload
      user.unread_notification_count.should == 0
    end

    it "should decrease notification count before destroy" do
      user = Factory(:user)
      comment = Factory(:comment)
      notification1 = user.notifications.create(:notifierable => comment)
      notification2 = user.notifications.create(:notifierable => comment)
      user.reload
      user.unread_notification_count.should == 2
      notification1.reload
      notification1.destroy
      user.reload
      user.unread_notification_count.should == 1
      notification2.reload
      notification2.destroy
      user.reload
      user.unread_notification_count.should == 0
    end

    it "should not decrease notification count when delete after read" do
      user = Factory(:user)
      comment = Factory(:comment)
      notification1 = user.notifications.create(:notifierable => comment)
      notification2 = user.notifications.create(:notifierable => comment)
      user.reload
      user.unread_notification_count.should == 2
      notification1.reload
      notification1.read!
      user.reload
      user.unread_notification_count.should == 1
      notification1.reload
      notification1.destroy
      user.reload
      user.unread_notification_count.should == 1
    end
  end

end
