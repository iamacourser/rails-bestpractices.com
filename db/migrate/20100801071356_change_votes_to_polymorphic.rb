class ChangeVotesToPolymorphic < ActiveRecord::Migration
  def self.up
    rename_column :votes, :post_id, :voteable_id
    add_column :votes, :voteable_type, :string

    Vote.all.each do |vote|
      vote.update_attribute(:voteable_type, 'Post')
    end
  end

  def self.down
    remove_column :votes, :voteable_type
    rename_column :votes, :voteable_id, :post_id
  end
end
