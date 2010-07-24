class PostsController < InheritedResources::Base
  before_filter :require_user, :only => [:new, :edit, :create, :update, :destroy]
  belongs_to :tag, :optional => true, :class_name => 'ActsAsTaggableOn::Tag',
    :finder => :find_by_name!, :param => :tag_id
  has_scope :hot
  has_scope :search
  respond_to :xml, :only => :index

  show! do |format|
    @post.increment!(:view_count)
    @comment = @post.comments.build
  end
  
  def archive
    @posts = Post.all
  end
  
  protected
    def begin_of_association_chain
      @current_user
    end
    
    def collection
      @posts ||= end_of_association_chain.includes(:user).paginate(:page => params[:page], :per_page => Post.per_page)
    end
end
