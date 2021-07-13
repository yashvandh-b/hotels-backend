class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?, :is_superadmin?, :is_admin?
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
       
    def logged_in?
        !!current_user
    end
    
    def require_user
        if !logged_in?
            flash[:alert] = "You must be logged in to perform that action."
            redirect_to login_path
        end
    end

    def is_superadmin?
        (current_user.role == 0)
    end

    def is_admin?
        (current_user.role == 1)
    end

end
