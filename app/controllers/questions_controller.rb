class QuestionsController < InheritedResources::Base
  before_filter :require_user, :only => [:new, :edit, :create, :update, :destroy]
  belongs_to :tag, :optional => true, :class_name => 'ActsAsTaggableOn::Tag',
    :finder => :find_by_name!, :param => :tag_id

  show! do |format|
    @question.increment!(:view_count)
  end

  protected
    def begin_of_association_chain
      @current_user
    end
end
