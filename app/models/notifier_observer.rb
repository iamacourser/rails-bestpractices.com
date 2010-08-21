class NotifierObserver < ActiveRecord::Observer
  observe :comment, :answer
  
  def after_create(model)
    notify(model)
  end

  private
    def notify(model)
    end
end
