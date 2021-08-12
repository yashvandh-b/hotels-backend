class ApplicationController < ActionController::Base

    include Pagy::Backend

    before_action :set_pagy_params, only: [:pagy_custom]
    helper_method :current_user, :logged_in?, :is_superadmin?, :is_admin?
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def pagy_custom(query)
		return [] if query.nil?
        page = params[:page] || 1
        items = params[:items] || 5
		pagy(query, { page: page, items: items.to_i }).last
	rescue Pagy::OverflowError # if no items present in that page, throws exception
		[]
	end
       
    def logged_in?
        return true
        !!current_user
    end
    
    def require_user
        if !logged_in?
            flash[:alert] = "You must be logged in to perform that action."
            redirect_to login_path
        end
    end

    def is_superadmin?
        return false
        (current_user.role == 0)
    end

    def is_admin?
        return true
        (current_user.role == 1)
    end

end
