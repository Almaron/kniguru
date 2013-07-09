class AuthenticationsController < ApplicationController
    
  def new 
      login_at(params[:provider])
  end
  
  def create
      provider = params[:provider]
      if current_user
          add_provider_to_user(provider)
          redirect_to current_user
      elsif @user = login_from(provider)
          redirect_to @user, :notice => "Login success"
      else
          @user = create_from(provider)          
          reset_session
          auto_login @user
          redirect_to @user
      end
  end

  def destroy
      @auth = Authentication.find(params[:id])
      @auth.destroy if @auth.user_id == current_user.id
      redirect_to user_path(@auth.user_id)
  end
  
end
