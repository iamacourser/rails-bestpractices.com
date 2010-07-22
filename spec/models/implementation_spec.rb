require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Implementation do

  include RailsBestPractices::Macros
  should_be_tweetable
  should_be_markdownable
  should_have_entries_per_page 10
  should_have_user_ownership

  should_belong_to :user
  should_belong_to :post
  should_have_many :comments, :dependent => :destroy
  should_validate_presence_of :body

end
