class AddActiveTokenIdToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :active_token_id, :integer
    add_index :users, :active_token_id
  end

  def self.down
    remove_index :users, :column => :active_token_id
    remove_column :users, :active_token_id
  end
end
