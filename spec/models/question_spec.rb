require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Question do

  before :each do
    @question = Factory.create(:question)
  end

  include RailsBestPractices::Macros
  should_act_as_taggable
  should_be_markdownable
  should_be_user_ownable
  should_have_entries_per_page 10

  should_have_many :answers, :dependent => :destroy
  should_have_many :votes, :dependent => :destroy
  should_validate_presence_of :title, :body
  should_validate_uniqueness_of :title
end
