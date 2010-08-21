require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe TweetObserver do

  include RailsBestPractices::Spec::Support

  it 'should be observing Post#create' do
    Post.delete_all
    within_observable_scope do |observer|
      instance = Factory.build(:post, :id => 1)
      observer.should_receive(:tweet).with(instance.tweet_title, instance.tweet_path)
      instance.save
    end
  end

  it 'should be observing Implementation#create' do
    post = Factory(:post)
    within_observable_scope do |observer|
      instance = Factory.build(:implementation, :post => post)
      observer.should_receive(:tweet).with(instance.tweet_title, instance.tweet_path)
      instance.save
    end
  end

  it 'should be observing Question#create' do
    Question.delete_all
    within_observable_scope do |observer|
      instance = Factory.build(:question, :id => 1)
      observer.should_receive(:tweet).with(instance.tweet_title, instance.tweet_path)
      instance.save
    end
  end

end
