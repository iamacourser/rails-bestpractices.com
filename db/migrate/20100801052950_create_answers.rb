class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.text :body
      t.text :formatted_html
      t.integer :user_id
      t.integer :vote_points, :default => 0
      t.integer :question_id

      t.timestamps
    end
  end

  def self.down
    drop_table :answers
  end
end
