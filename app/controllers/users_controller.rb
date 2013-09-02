class UsersController < ApplicationController

  layout "user"
    
include ActivateAndReset

  before_action :get_user, :only => [:show, :edit, :update, :destroy, :wall, :get_options, :set_options]
  
  def index
      @users = User.all
  end

  def show
     @user.save  
  end

  def wall
     unless @user.author
       redirect_to @user
     end
  end

  def new
      @user = User.new
    redirect_to root_path
  end

  def step2
    @user = User.new(user_params)
    unless @user.valid?
      render :new
    end
  end

  def create
      @user = User.new(user_params)
  end

  def edit
    redirect_to @user
  end

  def get_options
    redirect_to @user

  end

  def set_options

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
    @user = User.includes(:profile).find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile_attributes)
  end
  
end
