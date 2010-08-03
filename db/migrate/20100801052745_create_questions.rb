class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.string :title
      t.text :body
      t.text :formatted_html
      t.integer :user_id
      t.integer :vote_points, :default => 0
      t.integer :view_count, :default => 0
      t.integer :answers_count, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
