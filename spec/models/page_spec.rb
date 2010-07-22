require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Page do
  should_validate_presence_of :name
end
