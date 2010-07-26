class AddImplementedToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :implemented, :boolean, :default => false, :null => false

    Post.all.each do |post|
      if post.implementation
        post.update_attribute(:implemented, true)
      end
    end
  end

  def self.down
    remove_column :posts, :implemented
  end
end
