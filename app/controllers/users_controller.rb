class UsersController < ApplicationController

    before_action :set_user, only: [:edit, :update, :destroy]
    helper_method :role 

    def new 
        @user = User.new
    end

    def manageusers
        @users = User.page params[:page]
    end

    def create
        @user = User.new(user_params)
        if User.exists?(email: user_params[:email]) 
            redirect_to signup_path, notice: "User already exists" and return
        end
        if @user.save
            redirect_to login_path, notice: "User created."
        else
          render 'new', notice: "User Creation failed !!"
        end
    end

    def edit
    end

    def update
        unless @user.role == 0
            if @user.update(user_params)
                redirect_to manage_path, notice: "#{@user.email} was successfully updated."
            else
                render :edit, notice: "Updation failed !!"
            end
        else
            redirect_to manage_path, notice: "SuperAdmin role cannot be updated."
        end
    end

    def destroy
        unless @user.role == 0 
            @user.destroy
            respond_to do |format|
                format.html { redirect_to manage_path, notice: "User was successfully destroyed." }
            end
        else
            redirect_to manage_path, notice: "SuperAdmin cannot be destroyed."
        end
    end

    def role(user)
        (user.role == 0) ? "Super Admin" : (user.role == 1) ? "Admin" : "User"
    end

    private
    
    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:id, :email, :password, :password_confirmation, :role)
    end
end