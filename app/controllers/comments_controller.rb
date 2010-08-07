class CommentsController < InheritedResources::Base
  actions :create, :index
  belongs_to :question, :answer, :post, :polymorphic => true, :optional => true

  create! do |success, failure|
    success.html { redirect_to parent_url }
    failure.html { render failure_url }
  end

  def index
    if params[:post]
      @comments = Comment.post.includes(:user).paginate(:page => params[:page])
    end
  end

  private
    def parent_url
      if params[:question_id]
        question_path(@question)
      elsif params[:answer_id]
        question_path(@answer.question)
      elsif params[:post_id]
        post_path(@post)
      end
    end
    
    def failure_url
      if params[:question_id]
        'questions/show'
      elsif params[:answer_id]
        'questions/show'
      elsif params[:post_id]
        'posts/show'
      end
    end
end
