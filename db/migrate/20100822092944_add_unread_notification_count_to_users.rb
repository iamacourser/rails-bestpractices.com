class AddUnreadNotificationCountToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :unread_notification_count, :integer, :default => 0, :null => false
  end

  def self.down
    remove_column :users, :unread_notification_count
  end
end
