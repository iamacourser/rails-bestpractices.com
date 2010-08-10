class SearchController < ApplicationController

  def show
    @posts = Post.search(params[:search]).includes(:user, :tags).paginate(:page => params[:posts_page], :per_page => Post.per_page)
    @questions = Question.search(params[:search]).includes(:user, :tags).paginate(:page => params[:questions_page], :per_page => Question.per_page)
  end
end
