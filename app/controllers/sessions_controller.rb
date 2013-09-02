class SessionsController < ApplicationController

    
  before_action :require_login, :only => :destroy
  
  def new
      render :layout => false
  end

  def create
      if (@user = login(params[:user][:username],params[:user][:password]))
        redirect_to @user, :notice => "Login success."
      else
        render :new, :alert => "Login falure!!"
      end
  end

  def destroy
      logout
      redirect_to root_path, :notice => "Logout success."
  end
  
end
