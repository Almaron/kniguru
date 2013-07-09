module ActivateAndReset
    
    extend ActiveSupport::Concern
    
    def activate
    end
    
    def password_ask_email
        render :layout => false
    end
    
    def send_password_reset
        if @user = User.find_by(:email => params[:email])
    end
    
    def password_reset_form
    end

    def reset_password
    end
       
end