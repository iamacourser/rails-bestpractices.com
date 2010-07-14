class UserSessionsController < InheritedResources::Base
  actions :new, :create, :destroy
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy

  # create! do |success, failure|
  #     @user_session = UserSession.new(params[:user_session])
  #     @user_session.save do |result|
  #       if result
  #         flash[:notice] = "Login successful!"
  #         redirect_back_or_default account_url
  #       else
  #         render :action => :new
  #       end
  #     end
  #     success.html { redirect_back_or_default root_url }
  #     failure.html { render :action => :new }
  #   end

  def create
    @user_session = UserSession.new(params[:user_session])
    @request_token = UserSession.oauth_consumer.get_request_token
    session[:request_token] = @request_token
    @user_session.save do |result|
      if result
        flash[:notice] = "Login successful!"
        redirect_back_or_default account_url
      else
        render :action => :new
      end
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = t('flash.user_sessions.destroy.notice')
    redirect_back_or_default root_url
  end

  def show
    @request_token = session[:request_token]
    @access_token = @request_token.get_access_token
    @user = User.create(:oauth_token => @access_token.token,
    :oauth_secret => @access_token.secret)
    
    redirect_back_or_default root_url
  end
end
