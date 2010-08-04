class AddCommentsCountToQuestionsAndAnswers < ActiveRecord::Migration
  def self.up
    add_column :questions, :comments_count, :integer, :default => 0
    add_column :answers, :comments_count, :integer, :default => 0
  end

  def self.down
    remove_column :questions, :comments_count
    remove_column :answers, :comments_count
  end
end
