class AddCounterCacheToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :posts_count, :integer, :default => 0, :null => false
    add_column :users, :implementations_count, :integer, :default => 0, :null => false
    add_column :users, :comments_count, :integer, :default => 0, :null => false
    add_column :users, :votes_count, :integer, :default => 0, :null => false

    User.all.each do |user|
      User.update_counters user.id, :posts_count => user.posts.length, :implementations_count => user.implementations.length, :comments_count => user.comments.length, :votes_count => user.votes.length
    end
  end

  def self.down
    remove_column :users, :votes_count
    remove_column :users, :comments_count
    remove_column :users, :implementations_count
    remove_column :users, :posts_count
  end
end
