class Vote < ActiveRecord::Base

  include UserOwnable

  belongs_to :voteable, :polymorphic => true
  after_create :update_create_vote
  before_destroy :update_destroy_vote

  private

    def update_create_vote
      if like?
        voteable.increment!(:vote_points)
      else
        voteable.decrement!(:vote_points)
      end
    end

    def update_destroy_vote
      if like?
        voteable.decrement!(:vote_points)
      else
        voteable.increment!(:vote_points)
      end
    end

end
