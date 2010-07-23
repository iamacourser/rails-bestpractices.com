require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Comment do

  include RailsBestPractices::Macros
  should_be_user_ownable

  should_belong_to :commentable, :polymorphic => true
  should_validate_presence_of :body
  should_validate_presence_of :username

end
