class NotificationsController < InheritedResources::Base
  actions :index, :show
  before_filter :require_user

  protected
    def begin_of_association_chain
      @current_user
    end
end
