class UsersController < ApplicationController
    
include ActivateAndReset

  before_action :get_user, :only => [:show, :edit, :update, :destroy] 
  
  def index
      @users = User.all
  end

  def show
     @user.save  
  end

  def new
      @user = User.new
  end

  def create
      @user = User.create(user_params)
  end

  def edit
  end

  def update
      if @user.update(user_params)
          redirect_to users_path
      else
          render :edit
      end
  end


  def destroy
      @user.destroy
  end

  private
   
  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
