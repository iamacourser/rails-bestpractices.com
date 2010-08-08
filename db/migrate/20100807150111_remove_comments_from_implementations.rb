class RemoveCommentsFromImplementations < ActiveRecord::Migration
  def self.up
    remove_column :implementations, :comments_count
    Comment.delete_all("commentable_type = 'Implementation'")
  end

  def self.down
    add_column :implementations, :comments_count
  end
end
