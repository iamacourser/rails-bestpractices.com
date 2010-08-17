require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Notification do

  include RailsBestPractices::Macros
  should_have_entries_per_page 10

  should_belong_to :notifierable, :polymorphic => true
end
