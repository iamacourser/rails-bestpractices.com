class CommentsController < InheritedResources::Base
  actions :create, :index
  belongs_to :post, :implementation, :polymorphic => true, :optional => true

  create! do |success, failure|
    success.html { redirect_to parent_url }
    failure.html { render 'posts/show' }
  end

  def index
    if params[:post]
      @comments = Comment.post.includes(:user).paginate(:page => params[:page])
    elsif params[:implement]
      @comments = Comment.implement.includes(:user).paginate(:page => params[:page])
    end
  end

  private
    def parent_url
      if params[:implementation_id]
        post_implementation_path(@implementation.post)
      elsif params[:post_id]
        post_path(@post)
      end
    end
end
