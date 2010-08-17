class Notification < ActiveRecord::Base

  belongs_to :notifierable, :polymorphic => true
  belongs_to :user

  def self.per_page
    10
  end
end
