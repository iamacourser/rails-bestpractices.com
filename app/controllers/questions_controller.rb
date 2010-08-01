class QuestionsController < InheritedResources::Base
  before_filter :require_user, :only => [:new, :edit, :create, :update, :destroy]
  belongs_to :tag, :optional => true, :class_name => 'ActsAsTaggableOn::Tag',
    :finder => :find_by_name!, :param => :tag_id
  has_scope :most_voted
  has_scope :most_answered
  has_scope :not_answered

  show! do |format|
    @question.increment!(:view_count)
    @answer = @question.answers.build
  end

  protected
    def begin_of_association_chain
      @current_user
    end

    def collection
      @questions ||= end_of_association_chain.includes(:user).paginate(:page => params[:page], :per_page => Question.per_page)
    end
end
