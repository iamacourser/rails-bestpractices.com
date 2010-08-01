class VotesController < InheritedResources::Base
  before_filter :require_user
  actions :create, :destroy
  belongs_to :post, :question, :answer, :polymorphic => true

  def create
    @vote = parent.votes.create(:user_id => current_user.id, :like => like_value)
    create! do |format|
      format.html { redirect_to voteable_path }
    end
  end

  destroy! do |format|
    format.html { redirect_to voteable_path }
  end

  private
    def like_value
      params[:like] == "true" ? true : false
    end

    def parent
      if params[:post_id]
        @post ||= Post.find(params[:post_id])
      elsif params[:question_id]
        @question ||= Question.find(params[:question_id])
      elsif params[:answer_id]
        @answer ||= Answer.find(params[:answer_id])
      end
    end

    def voteable_path
      polymorphic_path(parent)
    end
end
