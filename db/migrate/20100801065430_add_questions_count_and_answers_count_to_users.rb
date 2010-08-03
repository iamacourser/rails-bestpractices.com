class AddQuestionsCountAndAnswersCountToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :questions_count, :integer, :default => 0, :null => false
    add_column :users, :answers_count, :integer, :default => 0, :null => false
  end

  def self.down
    remove_column :users, :answers_count
    remove_column :users, :questions_count
  end
end
