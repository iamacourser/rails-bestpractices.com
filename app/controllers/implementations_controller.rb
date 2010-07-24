class ImplementationsController < InheritedResources::Base
  before_filter :require_user, :only => [:new, :edit, :create, :update, :destroy]
  belongs_to :post, :optional => true, :singleton => true

  def index
    @implementations = Implementation.includes(:user, :post).paginate(:page => params[:page], :per_page => Implementation.per_page)
  end

  show! do |format|
    @comment = @implementation.comments.build
  end
end
