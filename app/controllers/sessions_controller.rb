class SessionsController < ApplicationController

  layout "user"
    
  before_action :require_user, :only => :destroy
  
  def new
    #  render :layout => false
  end

  def create
      if (@user = login(params[:username],params[:password]))
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
