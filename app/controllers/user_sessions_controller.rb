class UserSessionsController < InheritedResources::Base
  actions :new, :create, :destroy
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  
  def create
    @user_session = UserSession.new(params[:user_session])
    # uses a block to prevent double render error...
    # because oauth and openid use redirects
    @user_session.save do |result|
      if result
        flash[:notice] = "Login successful!"
        if @current_user
          redirect_back_or_default root_url
        else
          redirect_to new_user_session_path
        end
      else
        if @user_session.errors.on(:user)
          # if we set error on the base object, likely it's because we didn't find a user
          render :action => :confirm
        else
          render :action => :new
        end
      end
    end
  end
  
  def destroy
    current_user_session.destroy
    flash[:notice] = t('flash.user_sessions.destroy.notice')
    redirect_back_or_default root_url
  end
end
