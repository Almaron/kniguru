module ActivateAndReset
    
    extend ActiveSupport::Concern
    
    def activate
      if (@user = User.load_from_activation_token(params[:id]))
        @user.activate!
        redirect_to(login_path, :notice => 'User was successfully activated.')
      else
        not_authenticated
      end
    end
    
    def password_ask_email
        render :layout => false
    end
    
    def send_password_reset
      #if @user = User.find_by(:email => params[:email])
    end
    
    def password_reset_form
    end

    def reset_password
    end
       
end