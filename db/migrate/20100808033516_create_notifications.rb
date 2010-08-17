class CreateNotifications < ActiveRecord::Migration
  def self.up
    create_table :notifications do |t|
      t.integer :user_id
      t.string :notifierable_type
      t.integer :notifierable_id
      t.boolean :read, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :notifications
  end
end
