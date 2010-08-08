class TagsController < InheritedResources::Base
  actions :show

  show! do |format|
    params[:nav] = params[:nav] || "posts"
    @children = @tag.send(params[:nav]).includes(:user).paginate(:page => params[:page], :per_page => 10)
  end

  protected
    def resource
      @tag = ActsAsTaggableOn::Tag.find_by_name(params[:id])
    end
end
