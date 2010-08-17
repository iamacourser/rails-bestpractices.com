class NotifierObserver < ActiveRecord::Observer
  observe :comment, :answer
  
  def after_create(model)
    tweet(model.tweet_title, model.tweet_path)
  end
end
