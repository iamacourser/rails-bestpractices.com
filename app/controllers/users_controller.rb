class UsersController < InheritedResources::Base
  actions :new, :create, :edit, :update, :index
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  
  def create
    @user = User.new(params[:user])
    # block! see user_sessions_controller.rb for description
    @user.save do |result|
      if result
        flash[:notice] = "Account registered!"
        redirect_to root_url
      else
        redirect_to new_user_url
      end
    end
  end

  def update
    return create unless @current_user
    @user = @current_user # makes our views "cleaner" and more consistent
    @user.update_attributes(params[:user]) do |result|
      if result
        flash[:notice] = "Account updated!"
        redirect_to root_url
      else
        render :action => :edit
      end
    end
  end

private
  def resource
    @user = @current_user
  end

  def collection
    @users = User.order("(posts_count * 10 + comments_count * 2 + votes_count) desc").limit(50)
  end
end
