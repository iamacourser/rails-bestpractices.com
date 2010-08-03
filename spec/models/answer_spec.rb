require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Answer do

  include RailsBestPractices::Macros
  should_be_markdownable
  should_be_user_ownable

  should_belong_to :question
  should_have_many :votes, :dependent => :destroy
  should_validate_presence_of :body
end
