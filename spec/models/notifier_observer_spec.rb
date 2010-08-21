require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe NotifierObserver do

  include RailsBestPractices::Spec::Support

  it 'should be observing Comment#create' do
    post = Factory(:post)
    within_observable_scope do |observer|
      instance = Factory.build(:comment, :commentable => post)
      observer.should_receive(:notify).with(instance)
      instance.save
    end
  end

  it 'should be observing Answer#create' do
    question = Factory(:question)
    within_observable_scope do |observer|
      instance = Factory.build(:answer, :question => question)
      observer.should_receive(:notify).with(instance)
      instance.save
    end
  end
end
