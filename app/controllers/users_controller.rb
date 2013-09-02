class UsersController < ApplicationController

  layout "user"

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
    render :layout => "application"
    #redirect_to root_path
  end

  def step2
    @user = User.new(user_params)
    if @user.valid?
      @user.profile = Profile.new
      @user.need_agree = true
      render :layout => "application"
    else
      render :new
    end
  end

  def create
    @user = User.new(user_params)
    @paraa = user_params
    @user.profile = Profile.new(user_params[:profile])

    render :layout => "application"
    #if @user.save
    #  render :layout => "application"
    #else
    #  render :step2
    #end
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

  def activate
    if (@user = User.load_from_activation_token(params[:id]))
      @user.activate!
      redirect_to(login_path, :notice => 'User was successfully activated.')
    else
      not_authenticated
    end
  end

  def password_ask_email
    render :layout => "application"
  end

  def send_password_reset
    if (@user = User.find_by(:email => params[:username]))
      @user.deliver_reset_password_instructions!
      @text = t("password_reset.success")
    else
      @text = t("password_reset.fail")
    end
    render :layout => "application"
  end

  def password_reset_form
    @user = User.load_from_reset_password_token(params[:token])
    @token = params[:token]
    not_authenticated unless @user
  end

  def reset_password
    @token = params[:token]
    @user = User.load_from_reset_password_token(params[:token])
    not_authenticated and return unless @user
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.change_password!(params[:user][:password])
      auto_login(@user)
      redirect_to @user
    else
      render :action => :password_reset_form
    end
  end

  private
   
  def get_user
    @user = User.includes(:profile).find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :birthday, :email, :password, :password_confirmation, :profile_attributes => [:first_name])
  end
  
end
