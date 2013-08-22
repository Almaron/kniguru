class AuthenticationsController < ApplicationController
    
  def new 
      login_at(params[:provider])
  end
  
  def create
      provider = params[:provider]
      uid = auth_hash[:uid]
      if current_user
          auth = Authentication.find_or_create_by(:provider => provider, :uid => uid)
          auth.user = current_user
          auth.save
          redirect_to current_user
      elsif (auth = Auth.find_by(:provider => provider, :uid => uid)) && auth.user.present?
          auto_login auth.user
          redirect_to auth.user, :notice => "Login success"
      else
         auth = Authentication.find_or_create_by(:provider => provider, :uid => uid)
         session[:auth_id] = auth.id
         redirect_to new_user_path
      end
  end

  def destroy
      @auth = Authentication.find(params[:id])
      @auth.destroy if @auth.user_id == current_user.id
      redirect_to @auth.user
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
  
end
