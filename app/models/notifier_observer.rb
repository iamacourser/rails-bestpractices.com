class NotifierObserver < ActiveRecord::Observer
  observe :comment, :answer
  
  def after_create(model)
    notify(model)
  end

  private
    def notify(model)
      if model.is_a? Comment
        model.commentable.user.notifications.create(:notifierable => model)
      elsif model.is_a? Answer
        model.question.user.notifications.create(:notifierable => model)
      end
    end
end
